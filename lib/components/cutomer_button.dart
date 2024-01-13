import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/constants/app_colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: CustomText(
          text,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}
