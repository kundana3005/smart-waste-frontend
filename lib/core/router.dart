import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/login/user_login_screen.dart';
import '../screens/login/worker_login_screen.dart';
import '../screens/login/admin_login_screen.dart';
import '../screens/signup/user_signup_screen.dart';
import '../screens/signup/worker_signup_screen.dart';
import '../screens/signup/admin_signup_screen.dart';
import '../screens/user/user_home_screen.dart';
import '../screens/worker/worker_home_screen.dart';
import '../screens/admin/admin_home_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const userLogin = '/login/user';
  static const workerLogin = '/login/worker';
  static const adminLogin = '/login/admin';
  static const userSignup = '/signup/user';
  static const workerSignup = '/signup/worker';
  static const adminSignup = '/signup/admin';
  static const userHome = '/home/user';
  static const workerHome = '/home/worker';
  static const adminHome = '/home/admin';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case userLogin:
        return MaterialPageRoute(builder: (_) => UserLoginScreen());
      case workerLogin:
        return MaterialPageRoute(builder: (_) => WorkerLoginScreen());
      case adminLogin:
        return MaterialPageRoute(builder: (_) => AdminLoginScreen());
      case userSignup:
        return MaterialPageRoute(builder: (_) => UserSignupScreen());
      case workerSignup:
        return MaterialPageRoute(builder: (_) => WorkerSignupScreen());
      case adminSignup:
        return MaterialPageRoute(builder: (_) => AdminSignupScreen());
      case userHome:
        return MaterialPageRoute(builder: (_) => UserHomeScreen());
      case workerHome:
        return MaterialPageRoute(builder: (_) => WorkerHomeScreen());
      case adminHome:
        return MaterialPageRoute(builder: (_) => AdminHomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}