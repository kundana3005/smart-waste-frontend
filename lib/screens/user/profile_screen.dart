import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  // TODO: fetch user info from provider/state/backend
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 24),
            Text("Name: John Doe", style: TextStyle(fontSize: 18)),
            Text("Phone: +91-9876543210", style: TextStyle(fontSize: 18)),
            // Add more details/settings as needed
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