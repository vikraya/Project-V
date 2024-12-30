import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
    final String apiUrl;
    AuthService(this.apiUrl);

  Future<Map<String, dynamic>> logIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/users/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      return jsonDecode(response.body);
    } else {
      throw Exception("failed to register");
    }
  }

    Future<Map<String, dynamic>> signUp(String email, String password, String confirmPassword, String phoneNumber) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/users/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password, 'confirmPassword': confirmPassword, 'phoneNumber': phoneNumber}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      return jsonDecode(response.body);
    } else {
      throw Exception("failed to register");
    }
  }


  Future<Map<String, dynamic>> confirmSignup(String email, String confirmationCode) async {
    final response = await http.post(
      Uri.parse('$apiUrl/api/users/confirmSignup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'confirmationCode': confirmationCode}), 
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      return jsonDecode(response.body);
    } else {
      throw Exception("failed to register");
    }
  }
  
}