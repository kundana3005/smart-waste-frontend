import 'package:flutter/material.dart';

class WorkerProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Fetch worker progress info from backend/API
    return Scaffold(
      appBar: AppBar(title: Text("Worker Progress")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person, color: Colors.blueGrey),
            title: Text("Worker: John Doe"),
            subtitle: Text("Completed: 5\nPending: 2"),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text("Worker: Jane Smith"),
            subtitle: Text("Completed: 8\nPending: 1"),
            trailing: Icon(Icons.chevron_right),
          ),
          // Add more workers as needed
        ],
      ),
    );
  }
}