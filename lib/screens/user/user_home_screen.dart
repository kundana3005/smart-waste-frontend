import 'package:flutter/material.dart';
import 'complaint_upload_screen.dart';
import 'clean_photo_update_screen.dart';
import 'accuracy_report_screen.dart';

class UserHomeScreen extends StatefulWidget {
  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Dashboard")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            _AppCard(
              icon: Icons.camera_alt,
              label: "Complaint Upload",
              color: Colors.redAccent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ComplaintUploadScreen()));
              },
            ),
            _AppCard(
              icon: Icons.cleaning_services,
              label: "Clean Photo Update",
              color: Colors.green,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CleanPhotoUpdateScreen(
                      complaintPhotoPath: '/storage/emulated/0/Download/dummy_before.jpg',
                    ),
                  ),
                );
              },
            ),
            _AppCard(
              icon: Icons.analytics,
              label: "Accuracy Report",
              color: Colors.blueAccent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AccuracyReportScreen(accuracy: 0.93, label: "Very Clean"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _AppCard({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color.withOpacity(0.15),
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 50),
              SizedBox(height: 16),
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
