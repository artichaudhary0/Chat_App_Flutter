import 'package:chat_app_flutter/colors.dart';
import 'package:chat_app_flutter/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  static const routeName = '/otp-screen';
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  Widget build(BuildContext context) {
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
           Column(children: [
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
                   // if (val.length == 6) {
                   //   verifyOTP(ref, context, val.trim());
                   // }
                 },
               ),
             ),
           ],),
            SizedBox(
              width: size.width * 0.3,
              child: CustomButton(
                text: "Next",
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
