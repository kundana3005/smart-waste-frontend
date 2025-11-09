import 'package:flutter/material.dart';

class AccuracyReportScreen extends StatelessWidget {
  final double accuracy;
  final String label;

  const AccuracyReportScreen({required this.accuracy, required this.label});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accuracy Report")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.verified, size: 80, color: Colors.green),
              SizedBox(height: 20),
              Text(
                "Cleaned Area: ${(accuracy * 100).toStringAsFixed(2)}%",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "Result: $label",
                style: TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
