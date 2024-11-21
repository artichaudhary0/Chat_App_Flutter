import 'package:chat_app_flutter/colors.dart';
import 'package:flutter/cupertino.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: tabColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text,style: TextStyle(color: blackColor,fontWeight: FontWeight.w400),),
      ),
    );
  }
}
