import 'package:flutter/material.dart';

class WorkerProfileScreen extends StatelessWidget {
  // TODO: fetch worker info from provider/state/backend
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Worker Profile')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.work, size: 40),
            ),
            SizedBox(height: 24),
            Text("Name: Ajay Kumar", style: TextStyle(fontSize: 18)),
            Text("Location: 17.42, 78.42", style: TextStyle(fontSize: 18)),
            Text("Approved: Yes", style: TextStyle(fontSize: 18)),
            // Add more worker info/statistics
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