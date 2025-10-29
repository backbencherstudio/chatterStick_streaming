import 'package:flutter/cupertino.dart';

import '../../core/constant/route_names.dart';
import '../../features/home/presentation/view/screen/home_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../presentation/bottom_nav/bottom_nav_bar.dart';

class AppRoutes {
  static const String initialRoute = RouteNames.bottomNavBar;

  static final Map<String, WidgetBuilder> routes = {
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.bottomNavBar: (context) => const BottomNavBar(),
    RouteNames.home: (context) => const HomeScreen(),
  };
}