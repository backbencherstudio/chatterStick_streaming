import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/image_manager.dart';
import 'package:chatterstick_streaming_app/core/resource/font_manager.dart';
import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/widgets/logout.dart';
import 'package:chatterstick_streaming_app/presentation/setting/view/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resource/style_manager.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16.h),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    child: Image.asset(
                      ImageManager.profilePng,
                      height: 80.h,
                      width: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 30.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daniel Jones",
                        style: getMediumStyle18(
                          color: ColorManager.textPrimary,
                        ),
                      ),
                      Text(
                        "daniel.jones@example.com",
                        style: getLightStyle14(
                          color: ColorManager.subtitleText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                'General',
                style: getLightStyle14(
                  color: ColorManager.subtitleText3,
                  fontWeight: FontWeightManager.semiBold600,
                ),
              ),
              SizedBox(height: 12.h),
              ProfileListTile(
                title: "My Account",
                leadindIcon: IconManager.userSvg,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.myAccountScreen);
                },
              ),
              ProfileListTile(
                title: "Send Ideas",
                leadindIcon: IconManager.ideaSvg,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.sendIdeaScreen);
                },
              ),
              ProfileListTile(
                title: "Change password",
                leadindIcon: IconManager.lockPasswordSvg,
                onTap: () {
                  Navigator.pushNamed(context, RouteName.changeOldPasswordScreen);
                },
              ),
              ProfileListTile(
                title: "Log Out",
                leadindIcon: IconManager.logoutSvg,
                onTap: () {
                  onLogoutTap(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
