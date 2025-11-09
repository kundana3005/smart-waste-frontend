import 'package:flutter/material.dart';
import 'login/user_login_screen.dart';
import 'login/worker_login_screen.dart';
import 'login/admin_login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Smart Management', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 40),
          Icon(Icons.recycling, size: 100, color: Colors.green),
          SizedBox(height: 40),
          Text("Choose Your Role:"),
          SizedBox(height: 20),
          Wrap(spacing: 32, runSpacing: 20, children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text("User"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => UserLoginScreen())),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.work),
              label: Text("Worker"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => WorkerLoginScreen())),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.admin_panel_settings),
              label: Text("Admin"),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AdminLoginScreen())),
            ),
          ])
        ]),
      ),
    );
  }
}