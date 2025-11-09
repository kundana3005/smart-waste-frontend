import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  // TODO: fetch admin info from provider/state/backend
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Profile')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.admin_panel_settings, size: 40),
            ),
            SizedBox(height: 24),
            Text("Name: Site Admin", style: TextStyle(fontSize: 18)),
            Text("Email: admin@smartwaste.com", style: TextStyle(fontSize: 18)),
            // Add more admin details/controls
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // TODO: logout logic
              },
              child: Text("Logout"),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            )
          ],
        ),
      ),
    );
  }
}