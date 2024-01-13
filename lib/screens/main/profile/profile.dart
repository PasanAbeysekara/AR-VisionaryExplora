import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: CustomText(
        "Profile",
        fontSize: 34,
      ),
    );
  }
}
