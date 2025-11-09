import 'package:flutter/material.dart';
import '../worker/worker_home_screen.dart';

class WorkerSignupScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Worker Signup')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 24),
            ElevatedButton(
                child: Text("Signup"),
                onPressed: () {
                  // TODO: API signup
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => WorkerHomeScreen()));
                }
            ),
          ],
        ),
      ),
    );
  }
}