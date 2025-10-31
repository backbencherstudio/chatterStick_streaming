import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/constansts/icon_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    child: SvgPicture.asset(
                      IconManager.notificationSvg,
                      height: 24,
                      width: 24,
                    ),
                  ),
                  SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Daniel",
                        style: getMediumStyle18(
                          color: ColorManager.textPrimary,
                        ),
                      ),
                      Text(
                        "data@gmail.com",
                        style: getLightStyle14(
                          color: ColorManager.subtitleText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfileListTile(  title:"My Account" ,leadindIcon: IconManager.checkmarkSvg ,),
              ProfileListTile(  title:"My Account" ,leadindIcon: IconManager.downloadSvg ,),
              ProfileListTile(  title:"My Account" ,leadindIcon: IconManager.searchSvg ,),
              ProfileListTile(  title:"My Account" ,leadindIcon: IconManager.notificationSvg ,),
              ProfileListTile(  title:"My Account" ,leadindIcon: IconManager.downloadSvg ,),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  final String title;
  final String leadindIcon;

  const ProfileListTile({super.key, required this.title, required this.leadindIcon, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.fillColor,
          borderRadius: BorderRadius.circular(8.h),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
          leadindIcon,
            height: 24,
            width: 24,
          ),
          title: Text("data"),
          trailing: Icon(Icons.arrow_forward_ios,size: 24.h,color: ColorManager.iconColor,),
        ),
      ),
    );
  }
}
