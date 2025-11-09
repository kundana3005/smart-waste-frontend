import 'package:flutter/material.dart';
import '../user/user_home_screen.dart';

class UserSignupScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('User Signup')),
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
              TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone')),
              TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
              SizedBox(height: 24),
              ElevatedButton(
                  child: Text("Signup"),
                  onPressed: () {
                    // TODO: API signup and validation
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UserHomeScreen()));
                  }
              ),
            ],
          ),
        ));
  }
}