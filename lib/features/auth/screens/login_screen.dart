import 'dart:developer';

import 'package:chat_app_flutter/colors.dart';
import 'package:chat_app_flutter/common/utils/ultils.dart';
import 'package:chat_app_flutter/common/widgets/custom_button.dart';
import 'package:chat_app_flutter/features/auth/controller/auth_controller.dart';
import 'package:chat_app_flutter/features/auth/screens/opt_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country _country) {
        setState(() {
          country = _country;
        });
      },
    );
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();


    if (country != null && phoneNumber.isNotEmpty) {
      ref
          .read(authControllerProvider)
  .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
      log('+${country!.phoneCode}$phoneNumber');
    } else {
      showSnackBar(context: context, content: "Fill All Details");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter your phone number"),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("WhatsApp will need to verify your phone number"),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () => pickCountry(),
                  child: Text(
                    "Pick Country",
                    style: TextStyle(color: blueColor),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (country != null) Text("+${country!.phoneCode}"),
                    SizedBox(height: 5),
                    SizedBox(
                      width: size.width * 0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(hintText: "Phone Number"),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              width: size.width * 0.3,
              child: CustomButton(
                text: "Next",
                onTap: () => sendPhoneNumber(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
