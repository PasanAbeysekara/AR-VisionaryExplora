import 'package:ar_visionary_explora/controllers/auth_controller.dart';
import 'package:ar_visionary_explora/utils/helpers/alert_helpers.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
            .signupUser(context, _email.text, _password.text)
            .then((value) {
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
}
