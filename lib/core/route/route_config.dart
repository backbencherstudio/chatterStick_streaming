import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/auth/login/view/login_screen.dart';
import 'package:chatterstick_streaming_app/presentation/auth/login/view/verify_email_screen.dart';
import 'package:chatterstick_streaming_app/presentation/bottom_nav/view/bottom_nav_bar.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/my_account_screen.dart';
import 'package:chatterstick_streaming_app/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/auth/login/view/create_new_password_screen.dart';
import '../../presentation/auth/login/view/verify_otp_screen.dart';
import '../../presentation/auth/sign_up/view/sign_up_screen.dart';
import '../../presentation/auth/sign_up/view/verify_new_account_otp_screen.dart';
import '../../presentation/notification/view/notification_screen.dart';



class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
        case RouteName.notificationScreen:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
        case RouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case RouteName.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());
        case RouteName.verifyOTPScreen:
        return MaterialPageRoute(builder: (_) => const VerifyOTPScreen());
        case RouteName.createNewPasswordScreen:
        return MaterialPageRoute(builder: (_) => const CreateNewPasswordScreen());
        case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case RouteName.verifyNewAccountOtpScreen:
        return MaterialPageRoute(builder: (_) => const VerifyNewAccountOtpScreen());
        case RouteName.myAccountScreen:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
