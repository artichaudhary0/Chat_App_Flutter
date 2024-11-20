import 'package:chat_app_flutter/common/widgets/error.dart';
import 'package:chat_app_flutter/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorTextScreen(errorText: "This page does not exist"),
        ),
      );
  }
}
