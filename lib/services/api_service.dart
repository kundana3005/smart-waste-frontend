import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseBackendUrl = "https://smart-waste-backend-5na8.onrender.com";
  static const String baseMLUrl = "https://smart-management-mlserver.onrender.com";

  // Example: User login
  Future<bool> loginUser(String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseBackendUrl/api/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phone, 'password': password}),
    );
    return response.statusCode == 200;
  }

  // Example: Submit complaint (photo upload + location + userID)
  Future<bool> submitComplaint(
      String userId, String imagePath, double lat, double lng) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseBackendUrl/api/complaints'));
    request.fields['userId'] = userId;
    request.fields['lat'] = lat.toString();
    request.fields['lng'] = lng.toString();
    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    var response = await request.send();
    return response.statusCode == 200;
  }

  // Example: ML photo prediction
  Future<String> predictCleanPhoto(String imagePath) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseMLUrl/predict'));
    request.files.add(await http.MultipartFile.fromPath('file', imagePath));
    var streamed = await request.send();
    final responseStr = await streamed.stream.bytesToString();
    if (streamed.statusCode == 200) {
      return responseStr;
    }
    throw Exception("ML Prediction failed: $responseStr");
  }

  // ...Add more methods for signup, worker/admin routes, fetching complaints, etc.
}