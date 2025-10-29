
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/route/route_config.dart';
import '/core/route/route_name.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
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
      child: MaterialApp(
           debugShowCheckedModeBanner: false,

          // Use AppTheme for light/dark modes
        //   theme: AppTheme.light,
        //   darkTheme: AppTheme.dark,
        //   themeMode: ThemeMode.system,
        // title: 'Riverpod MVVM Demo',
        // theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: RouteName.splashScreen,
      ),
    );
  }
}
