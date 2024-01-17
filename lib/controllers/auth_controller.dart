
import 'package:ar_visionary_explora/utils/helpers/alert_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthConroller {
  /// Sign in user function

  Future<void> signupUser(BuildContext context, email, String password) async {
    try {
      // sent the email and password to firebase and try to create a user
      // final credential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((credential) {
        if (credential.user!.email != null) {
          Logger().w(credential);
          // Navigator.pushReplacementNamed(context, '/home');
          Logger().w("User created successfully");
        } else {
          Logger().w("User not created successfully");
        }
      });
    } on FirebaseAuthException catch (e) {
      AlertHelpers.showAlert(context, e.code);
    } catch (e) {
      AlertHelpers.showAlert(context, e.toString());
    }
  }
}
