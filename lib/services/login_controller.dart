import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../blank_page.dart';
import 'auth_model.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<void> login(String username, String password, String deviceKey, BuildContext context) async {
    String? token = await _authService.login(username, password, deviceKey);

    if (token != null) {
      print('Token: $token');
      // Save token in Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('auth_token', token);

      // Navigate to the blank page and prevent back navigation
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BlankPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }
}
