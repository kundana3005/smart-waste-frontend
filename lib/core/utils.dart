import 'package:flutter/material.dart';

void showSimpleDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context), child: Text("OK"))
      ],
    ),
  );
}