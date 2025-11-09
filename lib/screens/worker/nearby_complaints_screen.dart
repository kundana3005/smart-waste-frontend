import 'package:flutter/material.dart';

class NearbyComplaintsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: fetch complaints filtered by current location
    return Scaffold(
      appBar: AppBar(title: Text("Nearby Complaints")),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.red),
            title: Text("Complaint at Main Road"),
            subtitle: Text("Distance: 300m | Status: pending"),
            trailing: Icon(Icons.chevron_right),
            onTap: () {/* TODO: open complaint detail/upload photo */},
          ),
          // more nearby complaints
        ],
      ),
    );
  }
}