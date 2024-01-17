import 'package:ar_visionary_explora/utils/constants/app_assets.dart';
import 'package:ar_visionary_explora/utils/helpers/alert_helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthConroller {
  /// Sign in user function

  Future<void> signupUser(BuildContext context, String email, String password,
      String userName) async {
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
          // if success save the user data to firebase
          saveUserData(email, userName, credential.user!.uid);
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

// create a collection reference called users
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  /// save extra user data to firebase
  Future<void> saveUserData(String email, String userName, String uid) async {
    return users
        .doc(uid)
        .set({
          'uid': uid,
          'userName': userName,
          'email': email,
          'img': AppAssets.profileUrl,
        })
        .then((value) => Logger().i("User Added"))
        .catchError((error) => Logger().e("Failed to add user: $error"));
  }

  /// --- Login User Function ---
  Future<void> loginUser(
    BuildContext context,
    String loginEmail,
    String loginPassword,
  ) async {
    try {
      // sent the email and password to firebase and try to create a user
      // final credential =
      //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: loginEmail,
        password: loginPassword,
      )
          .then((credential) {
        Logger().w(credential);
      });
    } on FirebaseAuthException catch (e) {
      AlertHelpers.showAlert(context, e.code);
    } catch (e) {
      AlertHelpers.showAlert(context, e.toString());
    }
  }
}
