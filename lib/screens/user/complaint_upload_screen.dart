import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'clean_photo_update_screen.dart';

class ComplaintUploadScreen extends StatefulWidget {
  @override
  State<ComplaintUploadScreen> createState() => _ComplaintUploadScreenState();
}

class _ComplaintUploadScreenState extends State<ComplaintUploadScreen> {
  String? _imagePath;
  double? _latitude;
  double? _longitude;

  final ImagePicker _picker = ImagePicker();

  // Capture photo
  Future<void> _capturePhoto() async {
    if (!kIsWeb) {
      var status = await Permission.camera.request();
      if (status.isDenied || status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Camera permission denied")),
        );
        return;
      }
    }

    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        setState(() {
          _imagePath = photo.path;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No photo captured")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error capturing photo: $e")),
      );
    }
  }

  // Get location
  Future<void> _getLocation() async {
    if (!kIsWeb) {
      var status = await Permission.location.request();
      if (status.isDenied || status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Location permission denied")),
        );
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching location: $e")),
      );
    }
  }

  void _submitComplaint() {
    if (_imagePath == null || _latitude == null || _longitude == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please capture photo and location first")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("✅ Complaint submitted successfully!")),
    );

    // 👉 Navigate to clean photo update screen (pass complaint photo)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CleanPhotoUpdateScreen(complaintPhotoPath: _imagePath!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload New Complaint"), backgroundColor: Colors.deepPurple),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Capture Problem Photo"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _capturePhoto,
            ),
            const SizedBox(height: 20),
            if (_imagePath != null)
              (kIsWeb)
                  ? Text("Photo captured successfully ✅", style: TextStyle(color: Colors.green))
                  : Image.file(File(_imagePath!), height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.location_on),
              label: Text("Detect Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _getLocation,
            ),
            const SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.map, color: Colors.orange),
                title: Text("Location"),
                subtitle: Text(
                  _latitude == null || _longitude == null
                      ? "No location detected"
                      : "Lat: $_latitude, Lng: $_longitude",
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitComplaint,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Submit Complaint"),
            ),
          ],
        ),
      ),
    );
  }
}
