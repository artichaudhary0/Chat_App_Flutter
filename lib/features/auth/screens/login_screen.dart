import 'package:chat_app_flutter/colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your Phone Number"),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "WhatsApp will need to verify your phone number",
          ),
          Text(
            "Pick Country",
          ),
        ],
      ),
    );
  }
}
