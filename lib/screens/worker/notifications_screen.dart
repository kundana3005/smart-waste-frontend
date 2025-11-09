import 'package:flutter/material.dart';

class WorkerNotificationsScreen extends StatelessWidget {
  // TODO: subscribe to notifications from backend or provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Worker Notifications')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('New complaint assigned: C016'),
            subtitle: Text('Location: 17.43, 78.45'),
          ),
          ListTile(
            leading: Icon(Icons.check, color: Colors.green),
            title: Text('Complaint C013 marked resolved'),
            subtitle: Text('Great job!'),
          ),
          // TODO: More notifications for worker
        ],
      ),
    );
  }
}