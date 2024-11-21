import 'package:flutter/cupertino.dart';

class ErrorTextScreen extends StatelessWidget {
  final String errorText;
  static const routeName = '/error-text-screen';
  const ErrorTextScreen(this.errorText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText),
    );
  }
}
