import 'package:flutter/material.dart';

class AdminNotificationsScreen extends StatelessWidget {
  // TODO: subscribe to notifications from backend or provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Notifications')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.assignment_ind, color: Colors.orange),
            title: Text('Worker Ajay assigned complaint C017'),
            subtitle: Text('Monitor progress in Worker Progress'),
          ),
        ],
      ),
    );
  }
}