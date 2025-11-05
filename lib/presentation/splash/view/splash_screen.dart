// ignore_for_file: use_build_context_synchronously
import 'package:chatterstick_streaming_app/core/network/api_clients.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/sources/local/shared_preference/shared_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () async {
   // await SharedPreferenceData.removeToken();
      final token = await SharedPreferenceData.getToken();
      if (token != null) {
        ApiClient.headerSet(null);
        Navigator.pushNamed(context, RouteName.bottomNavBar);
      } else {
        Navigator.pushReplacementNamed(context, RouteName.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImageManager.splash, width: 248.w),
        ),
      ),
    );
  }
}
