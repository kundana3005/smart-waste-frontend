import 'package:flutter/material.dart';

class UserNotificationsScreen extends StatelessWidget {
  // TODO: subscribe to notifications from backend or provider
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.check_circle_outline, color: Colors.green),
            title: Text('Complaint C013 resolved successfully!'),
            subtitle: Text('Your area has been cleaned.'),
          ),
          ListTile(
            leading: Icon(Icons.warning_amber, color: Colors.red),
            title: Text('Pending complaint C014'),
            subtitle: Text('Action is being taken.'),
          ),
          // TODO: Render more user notifications, dynamically via provider/stream
        ],
      ),
    );
  }
}