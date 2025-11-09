import 'package:flutter/material.dart';

class ComplaintListTile extends StatelessWidget {
  final String status;
  final String id;
  final VoidCallback? onTap;
  const ComplaintListTile({required this.status, required this.id, this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Icon(Icons.warning), backgroundColor: _statusColor()),
      title: Text('Complaint: $id'),
      subtitle: Text('Status: $status'),
      trailing: Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }

  Color _statusColor() {
    switch (status.toLowerCase()) {
      case 'resolved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}