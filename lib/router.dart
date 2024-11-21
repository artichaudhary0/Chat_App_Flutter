import 'package:chat_app_flutter/features/landing/screen/landing_screen.dart';
import 'package:flutter/material.dart';

import 'common/widgets/error_screen.dart';
import 'features/auth/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LandingScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LandingScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: ErrorTextScreen("This page does not exist!"),
        ),
      );
  }
}
