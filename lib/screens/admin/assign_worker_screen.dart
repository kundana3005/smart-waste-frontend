import 'package:flutter/material.dart';

class AssignWorkerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Implement worker list and assignment logic
    return Scaffold(
      appBar: AppBar(title: Text("Assign Worker")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.warning, color: Colors.red),
            title: Text("Complaint: C012"),
            subtitle: Text("Location: 17.3, 78.4"),
            trailing: ElevatedButton(
              child: Text("Assign Worker"),
              onPressed: () {/* TODO: assign logic */},
            ),
          ),
          // more complaints
        ],
      ),
    );
  }
}