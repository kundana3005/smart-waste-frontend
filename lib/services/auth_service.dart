import 'dart:convert';
import 'package:http/http.dart' as http;
import 'storage_service.dart';
import '../core/config.dart';
import 'api_service.dart';

class AuthService {
  final StorageService _storage = StorageService();
  final ApiService _api = ApiService();

  /// User Login
  Future<bool> loginUser(String phone, String password) async {
    try {
      final resp = await http.post(
        Uri.parse('${AppConfig.apiBaseUrl}/api/user/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'phone': phone, 'password': password}),
      );
      print('User login => ${resp.statusCode} : ${resp.body}');
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final token = data['token'] ?? 'user-token-placeholder';
        await _storage.saveToken(token);
        await _storage.saveRole('user');
        return true;
      }
      return false;
    } catch (e) {
      print('LoginUser Error: $e');
      return false;
    }
  }

  /// Worker Login
  Future<bool> loginWorker(String name, String password) async {
    try {
      final resp = await http.post(
        Uri.parse('${AppConfig.apiBaseUrl}/api/worker/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'password': password}),
      );
      print('Worker login => ${resp.statusCode} : ${resp.body}');
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final token = data['token'] ?? 'worker-token-placeholder';
        await _storage.saveToken(token);
        await _storage.saveRole('worker');
        return true;
      }
      return false;
    } catch (e) {
      print('LoginWorker Error: $e');
      return false;
    }
  }

  /// Admin Login
  Future<bool> loginAdmin(String name, String password) async {
    try {
      final resp = await http.post(
        Uri.parse('${AppConfig.apiBaseUrl}/api/admin/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'name': name, 'password': password}),
      );
      print('Admin login => ${resp.statusCode} : ${resp.body}');
      if (resp.statusCode == 200) {
        final data = jsonDecode(resp.body);
        final token = data['token'] ?? 'admin-token-placeholder';
        await _storage.saveToken(token);
        await _storage.saveRole('admin');
        return true;
      }
      return false;
    } catch (e) {
      print('LoginAdmin Error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.clearAll();
  }

  Future<String?> getToken() => _storage.getToken();
  Future<String?> getRole() => _storage.getRole();
}
