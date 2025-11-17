import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/auth/login/view/login_screen.dart';
import 'package:chatterstick_streaming_app/presentation/auth/login/view/forgot_password_screen.dart';
import 'package:chatterstick_streaming_app/presentation/bottom_nav/view/bottom_nav_bar.dart';
import 'package:chatterstick_streaming_app/presentation/comic_details/view/comic_details_screen.dart';
import 'package:chatterstick_streaming_app/presentation/comic_details/view/read_comics_episode_screen.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/my_account_screen.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/send_idea_screen.dart';
import 'package:chatterstick_streaming_app/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/auth/login/view/create_new_password_screen.dart';
import '../../presentation/auth/login/view/verify_otp_screen.dart';
import '../../presentation/auth/sign_up/view/sign_up_screen.dart';
import '../../presentation/auth/sign_up/view/verify_sign_up_otp_screen.dart';
import '../../presentation/notification/view/notification_screen.dart';
import '../../presentation/setting/view/change_old_password_screen.dart';



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

        case RouteName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

        case RouteName.verifyOTPScreen:
        return MaterialPageRoute(builder: (_){
          final email = settings.arguments as String;
          return VerifyOTPScreen(email: email,);
        });

      case RouteName.createNewPasswordScreen:
        return MaterialPageRoute(builder: (_) {
          final args = settings.arguments as List<String>;
          final email = args[0];
          final token = args[1];
          return CreateNewPasswordScreen(
            email: email,
            token: token,
          );
        });

      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
        case RouteName.verifyNewAccountOtpScreen:
        return MaterialPageRoute(builder: (_){
          final email = settings.arguments as String;
          return VerifySignUpOtpScreen(email: email,);
        });
        case RouteName.myAccountScreen:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
        case RouteName.sendIdeaScreen:
        return MaterialPageRoute(builder: (_) => const SendIdeaScreen());
        case RouteName.changeOldPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangeOldPasswordScreen());
        case RouteName.comicDetailsScreen:
        return MaterialPageRoute(builder: (_) => const ComicDetailsScreen());
        case RouteName.readComicsEpisodeScreen:
        return MaterialPageRoute(builder: (_) => const ReadComicsEpisodeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
