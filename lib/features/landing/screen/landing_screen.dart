import 'package:chat_app_flutter/colors.dart';
import 'package:chat_app_flutter/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                fontSize: 33,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: size.height / 9),
            Image.asset(
              "assets/bg.png",
              height: 340,
              width: 340,
              color: tabColor,
            ),
            SizedBox(height: size.height / 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Read our Privacy Policy. Tap Agree and Continue to accept the terms and condition.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: greyColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: size.width * 0.75,
              child: CustomButton(
                text: "ACCEPT AND CONTINUE",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
