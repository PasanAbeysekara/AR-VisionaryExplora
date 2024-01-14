import 'package:animate_do/animate_do.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: FadeInLeft(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomText(
                    "Profile",
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 122,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(45),
                    child: Image.network(
                      AppAssets.profileUrl,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const CustomText(
                    "Tenny Robinson",
                    fontSize: 13,
                    color: AppColors.ash,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  const CustomText(
                    "Tenny@gmail.com",
                    fontSize: 13,
                    color: AppColors.ash,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  text: "LogOut",
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
