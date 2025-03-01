import 'package:chat_app_flutter/colors.dart';
import 'package:chat_app_flutter/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPScreen extends ConsumerWidget {
  static const routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP) {
    ref.read(authControllerProvider).verifyOTP(
          context,
          verificationId,
          userOTP,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Verifying your number"),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                const Text('We have sent an SMS with a code.'),
                SizedBox(
                  width: size.width * 0.5,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '- - - - - -',
                      hintStyle: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      if (val.length == 6) {
                        print("verifying otp");
                        verifyOTP(ref, context, val.trim());
                      }
                    },
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   width: size.width * 0.3,
            //   child: CustomButton(
            //     text: "Next",
            //     onTap: () {},
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
