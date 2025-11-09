import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CleanPhotoScreen extends StatefulWidget {
  @override
  State<CleanPhotoScreen> createState() => _CleanPhotoScreenState();
}

class _CleanPhotoScreenState extends State<CleanPhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _cleanImage;

  Future<void> _requestPermissions() async {
    if (!kIsWeb) {
      final cameraStatus = await Permission.camera.request();
      final storageStatus = await Permission.storage.request();

      if (!cameraStatus.isGranted || !storageStatus.isGranted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Camera or storage permission denied")),
        );
        return;
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    await _requestPermissions();
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _cleanImage = pickedFile;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error selecting image: $e")),
      );
    }
  }

  void _submitCleanPhoto() {
    if (_cleanImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select or capture a photo first")),
      );
      return;
    }

    // TODO: Add your API upload logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Clean photo submitted successfully ✅")),
    );

    // Optionally clear image after submission
    setState(() {
      _cleanImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Clean Photo'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Capture Clean Photo"),
              onPressed: () => _pickImage(ImageSource.camera),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text("Pick from Gallery"),
              onPressed: () => _pickImage(ImageSource.gallery),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 24),
            _cleanImage == null
                ? Card(
                    child: ListTile(
                      leading: Icon(Icons.image_not_supported, color: Colors.grey),
                      title: Text("No photo selected"),
                      subtitle: Text("Capture or choose a clean area photo"),
                    ),
                  )
                : kIsWeb
                    ? Image.network(
                        _cleanImage!.path,
                        height: 220,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_cleanImage!.path),
                          height: 220,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
            Spacer(),
            ElevatedButton.icon(
              icon: Icon(Icons.cloud_upload),
              label: Text('Submit Clean Photo'),
              onPressed: _submitCleanPhoto,
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
