import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:labadaph2_mobile/common/theme_testpage.dart';
import 'package:labadaph2_mobile/login/login_signup_page.dart';
import 'package:labadaph2_mobile/password-reset/new_password_page.dart';
import 'package:labadaph2_mobile/password-reset/password_reset_success_page.dart';
import 'package:labadaph2_mobile/password-reset/reset_password_page.dart';
import 'package:labadaph2_mobile/register/register1_page.dart';
import 'package:labadaph2_mobile/user/users_service.dart';

import 'common/error_page.dart';
import 'home/home_page.dart';

class Routes {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UsersService _userService = UsersService();

  Routes();

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    // Handle '/'
    if (settings.name == LoginSignupPage.routeName) {
      return MaterialPageRoute(builder: (context) => LoginSignupPage());
    } else if (settings.name == ThemeTestPage.routeName) {
      return MaterialPageRoute(builder: (context) => ThemeTestPage());
    } else if (settings.name == ResetPasswordPage.routeName) {
      return MaterialPageRoute(builder: (context) => ResetPasswordPage());
    } else if (settings.name == PasswordResetSuccessPage.routeName) {
      return MaterialPageRoute(
          builder: (context) => PasswordResetSuccessPage());
    } else if (settings.name == NewPasswordPage.routeName) {
      return MaterialPageRoute(builder: (context) => NewPasswordPage());
    } else if (settings.name == HomePage.routeName) {
      return MaterialPageRoute(builder: (context) => HomePage());
    } else if (settings.name == Register1Page.routeName) {
      return MaterialPageRoute(builder: (context) => Register1Page());
    }

    return MaterialPageRoute(
      builder: (context) =>
          ErrorPage("Invalid navigation route ${settings.name}"),
    );
  }
}
