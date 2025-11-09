import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../core/router.dart';

class WorkerLoginScreen extends StatefulWidget {
  @override
  State<WorkerLoginScreen> createState() => _WorkerLoginScreenState();
}

class _WorkerLoginScreenState extends State<WorkerLoginScreen> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  bool _loading = false;

  void _login() async {
    final name = _nameController.text.trim();
    final pass = _passwordController.text.trim();
    if (name.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter name and password')));
      return;
    }
    setState(() => _loading = true);
    final ok = await _auth.loginWorker(name, pass);
    setState(() => _loading = false);
    if (ok) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.workerHome, (_) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Worker Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 12),
            TextField(controller: _passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: _loading ? null : _login, child: _loading ? const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)) : const Text('Login')),
            ),
            TextButton(onPressed: () => Navigator.pushNamed(context, AppRoutes.workerSignup), child: const Text("Signup"))
          ],
        ),
      ),
    );
  }
}