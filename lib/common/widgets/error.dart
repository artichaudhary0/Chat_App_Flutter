import 'package:flutter/cupertino.dart';

class ErrorTextScreen extends StatelessWidget {
  static const routeName = "/error-text-screen";
  final String errorText;
   const ErrorTextScreen({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}
