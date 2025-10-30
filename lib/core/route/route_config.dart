
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/bottom_nav/view/bottom_nav_bar.dart';
import 'package:chatterstick_streaming_app/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../presentation/auth/login_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
