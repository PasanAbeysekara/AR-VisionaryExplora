import 'package:ar_visionary_explora/controllers/auth_controller.dart';
import 'package:ar_visionary_explora/screens/auth/signup.dart';
import 'package:ar_visionary_explora/screens/main/main_screen.dart';
import 'package:ar_visionary_explora/utils/helpers/alert_helpers.dart';
import 'package:ar_visionary_explora/utils/helpers/helpers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthProvider extends ChangeNotifier {
  /// auth controller object
  AuthConroller _authConroller = AuthConroller();

  //userName textfiled controller
  final TextEditingController _userName = TextEditingController();

  TextEditingController get userName => _userName;
  //email textfiled controller
  final TextEditingController _email = TextEditingController();

  TextEditingController get email => _email;
  // password textfiled controller
  final TextEditingController _password = TextEditingController();

  TextEditingController get password => _password;

  ///
  /// validate text input
  ///
  bool validateField(BuildContext context) {
    // first checking if all the text field are emty or not
    if (_userName.text.isEmpty &&
        _email.text.isEmpty &&
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
      return true;
    }
  }

  /// Loader state
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// set loader state
  void setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  /// Start the signup process
  Future<void> startSignup(BuildContext context) async {
    try {
      /// validate the input
      if (validateField(context)) {
        // start the loader
        setLoading(true);
        // start creating the user
        await _authConroller
            .signupUser(context, _email.text, _password.text, _userName.text)
            .then((value) {
          // clear the controllers
          _email.clear();
          _password.clear();
          _userName.clear();

          // stop the loader
          setLoading(false);
          // AlertHelpers.showAlert(context, "User Created Successfully",
          //     type: DialogType.success);
        });
      }
    } catch (e) {
      Logger().w(e);
      setLoading(false);
      AlertHelpers.showAlert(context, e.toString());
    }
  }

  /// initialize the user and listen to the auth state changes

  Future<void> initializedUser(BuildContext context) async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Logger().w('User is currently signed out!');

        /// if user is null then navigate to signup screen
        Helpers.navigateToPage(context, Signup());
      } else {
        Logger().w('User is signed in!');
        Helpers.navigateToPage(context, const MainScreen());
      }
    });
  }

  /// sign out function
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  /// --- Login User Feature ---
  //email textfiled controller
  final TextEditingController _loginEmail = TextEditingController();

  TextEditingController get loginEmail => _loginEmail;
  // password textfiled controller
  final TextEditingController _loginPassword = TextEditingController();

  TextEditingController get loginPassword => _loginPassword;

  bool validateLoginField(BuildContext context) {
    // first checking if all the text field are emty or not
    if (_loginEmail.text.isEmpty && _loginPassword.text.isEmpty) {
      Logger().w("Please fill the all the field");
      AlertHelpers.showAlert(context, "Please fill the all the fields");
      return false;
    } else if (!_loginEmail.text.contains("@")) {
      Logger().w("Please enter valid email");
      AlertHelpers.showAlert(context, "Please enter valid email");
      return false;
    } else if (_loginPassword.text.length < 6) {
      Logger().w("Password must have more than 6 digits");
      AlertHelpers.showAlert(context, "Password must have more than 6 digits");
      return false;
    } else {
      Logger().w("All fileds are validated");
      return true;
    }
  }

  /// Start the login process
  Future<void> startLogin(BuildContext context) async {
    try {
      /// validate the input
      if (validateLoginField(context)) {
        // start the loader
        setLoading(true);
        // start creating the user
        await _authConroller
            .loginUser(context, _loginEmail.text, _loginPassword.text)
            .then((value) {
          // clear the controllers
          _loginEmail.clear();
          _loginPassword.clear();

          // stop the loader
          setLoading(false);
        });
      }
    } catch (e) {
      Logger().w(e);
      setLoading(false);
      AlertHelpers.showAlert(context, e.toString());
    }
  }

  // --- Reset User Password Function ---

  // password textfiled controller
  final TextEditingController _resetEmail = TextEditingController();

  TextEditingController get resetEmail => _resetEmail;

  /// Start the login process
  Future<void> SendPasswordResetEmail(BuildContext context) async {
    try {
      /// validate the input
      if (_resetEmail.text.isNotEmpty) {
        // start the loader
        setLoading(true);
        // start creating the user
        await _authConroller.sendEmail(context, _resetEmail.text).then((value) {
          // clear the controllers
          _resetEmail.clear();

          // stop the loader
          setLoading(false);
        });
      }
    } catch (e) {
      Logger().w(e);
      setLoading(false);
      AlertHelpers.showAlert(context, e.toString());
    }
  }
}