import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<String?> login(String username, String password, String deviceKey) async {
    final url = Uri.parse('https://musicapp.jissanto.com/api/login');
    final response = await http.post(
      url,
      body: json.encode({'username': username, 'password': password, 'device_key': deviceKey}),
      headers: {'Content-Type': 'application/json'},
    );

      print('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Login successful, token: ${data['token']}');
      return data['token']; // Assuming the token is returned in the response
    } else {
      print('Login failed with status code: ${response.statusCode}'); // Debugging line
      print('Response body: ${response.body}');
      ;
    }
    return null;
  }
}
