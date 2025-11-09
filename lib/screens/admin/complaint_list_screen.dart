import 'package:flutter/material.dart';
import '../../widgets/complaint_list_tile.dart';

class ComplaintListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Real fetching/scroll/pagination, filters
    return Scaffold(
      appBar: AppBar(title: Text("All Complaints")),
      body: ListView(
        children: [
          ComplaintListTile(id: "C013", status: "pending", onTap: () {}),
          ComplaintListTile(id: "C014", status: "resolved", onTap: () {}),
          ComplaintListTile(id: "C015", status: "pending", onTap: () {}),
        ],
      ),
    );
  }
}