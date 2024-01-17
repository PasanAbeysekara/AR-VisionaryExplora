import 'package:animate_do/animate_do.dart';
import 'package:ar_visionary_explora/components/app_logo.dart';
import 'package:ar_visionary_explora/components/common_back_button.dart';
import 'package:ar_visionary_explora/components/custom_text.dart';
import 'package:ar_visionary_explora/components/custom_textfield.dart';
import 'package:ar_visionary_explora/components/cutomer_button.dart';
import 'package:ar_visionary_explora/components/social_button.dart';
import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/constants/app_colors.dart';
import 'package:ar_visionary_explora/screens/auth/fogot_password.dart';
import 'package:ar_visionary_explora/screens/main/main_screen.dart';
import 'package:ar_visionary_explora/utils/helpers/alert_helpers.dart';
import 'package:ar_visionary_explora/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //email textfiled controller
  final TextEditingController _email = TextEditingController();
  // password textfiled controller
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: CommonBackButton(),
                ),
                const CustomText(
                  "Login",
                  fontSize: 25,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 41,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 30,
                ),
                CustomerTextField(
                  hintText: "Enter your Email",
                  labelText: "Email",
                  controller: _email,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomerTextField(
                  hintText: "Enter your Password",
                  labelText: "Password",
                  isObscure: true,
                  controller: _password,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FogotPassword()),
                      );
                    },
                    child: const Text(
                      "Fogot your password?",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: "Login",
                  onTap: () {
                    Logger().i(_email.text);
                    //  Helpers.navigateToPage(context, const MainScreen());
                     if (validateField()) {
                      Logger().w("All fields are validated");
                    }
                  },
                ),
                const SizedBox(
                  height: 23,
                ),
                const CustomText(
                  "or login with social account",
                  fontSize: 14,
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      path: AppAssets.google,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SocialButton(
                      path: AppAssets.fb,
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool validateField() {
    // first checking if all the text field are emty or not
    if (_email.text.isEmpty &&
        _password.text.isEmpty) {
      Logger().w("Please fill the all the field");
      AlertHelpers.showAlert(context, "Please fill the all the fields");
      return false;
    } else if (!_email.text.contains("@")) {
      Logger().w("Please enter valid email");
      AlertHelpers.showAlert(context, "Please enter valid email");
      return false;
    } else if (_password.text.length < 6) {
      Logger().w("Password must have more than 6 digits");
      AlertHelpers.showAlert(context, "Password must have more than 6 digits");
      return false;
    } else {
      Logger().w("All fileds are validated");
      AlertHelpers.showAlert(context, "All fileds are validated");
      return true;
    }
  }
}
