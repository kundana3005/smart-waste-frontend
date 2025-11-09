import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import 'accuracy_report_screen.dart';

class CleanPhotoUpdateScreen extends StatefulWidget {
  final String complaintPhotoPath; // the "before" photo

  CleanPhotoUpdateScreen({required this.complaintPhotoPath});

  @override
  State<CleanPhotoUpdateScreen> createState() => _CleanPhotoUpdateScreenState();
}

class _CleanPhotoUpdateScreenState extends State<CleanPhotoUpdateScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _cleanPhoto;
  bool _isLoading = false;

  Future<void> _requestPermissions() async {
    if (!kIsWeb) {
      await Permission.camera.request();
      await Permission.storage.request();
    }
  }

  Future<void> _capturePhoto() async {
    await _requestPermissions();
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() => _cleanPhoto = pickedFile);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  Future<void> _pickFromGallery() async {
    await _requestPermissions();
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => _cleanPhoto = pickedFile);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error selecting photo: $e")));
    }
  }

  Future<void> _analyzeAccuracy() async {
    if (_cleanPhoto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select or capture the clean photo first")),
      );
      return;
    }

    setState(() => _isLoading = true);

    final uri = Uri.parse('https://smart-management-mlserver.onrender.com/compare');

    try {
      var request = http.MultipartRequest('POST', uri);

      // 👇 Match these field names with your ML API expectations
      request.files.add(await http.MultipartFile.fromPath('before', widget.complaintPhotoPath));
      request.files.add(await http.MultipartFile.fromPath('after', _cleanPhoto!.path));

      // Add standard headers (optional)
      request.headers.addAll({"Accept": "application/json"});

      var response = await request.send();
      final resBody = await response.stream.bytesToString();

      setState(() => _isLoading = false);

      if (response.statusCode == 200) {
        final data = jsonDecode(resBody);
        double accuracy = data['accuracy'] is int
            ? (data['accuracy'] as int).toDouble()
            : data['accuracy'];
        String label = data['label'] ?? "Unknown";

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                AccuracyReportScreen(accuracy: accuracy, label: label),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server error ${response.statusCode}: $resBody")),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to connect: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Cleaned Area Photo'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text("Pick from Gallery"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _pickFromGallery,
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Capture Clean Photo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _capturePhoto,
            ),
            SizedBox(height: 24),

            // Preview image
            if (_cleanPhoto != null)
              kIsWeb
                  ? Image.network(
                      _cleanPhoto!.path,
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(_cleanPhoto!.path),
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
            else
              Card(
                child: ListTile(
                  leading: Icon(Icons.image_not_supported, color: Colors.grey),
                  title: Text("No photo selected"),
                  subtitle: Text("Capture or choose a photo to preview"),
                ),
              ),
            Spacer(),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: _analyzeAccuracy,
                    icon: Icon(Icons.analytics),
                    label: Text('Analyze Accuracy'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
