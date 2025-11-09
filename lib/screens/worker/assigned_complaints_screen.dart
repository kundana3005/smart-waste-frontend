import 'package:flutter/material.dart';
import '../../widgets/complaint_list_tile.dart';

class AssignedComplaintsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Fetch real assignments for this logged in worker
    return Scaffold(
      appBar: AppBar(title: Text('Assigned Complaints')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) => ComplaintListTile(
          id: "C01${i+1}",
          status: i == 0 ? "pending" : "resolved",
          onTap: () {
            // TODO: Go to details or upload clean photo
          },
        ),
      ),
    );
  }
}