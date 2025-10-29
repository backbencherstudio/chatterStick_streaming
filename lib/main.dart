import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app/routes/app_routes.dart';
import 'app/viewmodels/app_viewmodels.dart';
import 'app/themes/app_theme.dart';
import 'core/di/di_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  // await diConfig();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return ScreenUtilInit(
      designSize: width >600?Size(800,1280) : Size( 390, 840),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter App',
          debugShowCheckedModeBanner: false,

          // Use AppTheme for light/dark modes
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,

          initialRoute: AppRoutes.initialRoute,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
