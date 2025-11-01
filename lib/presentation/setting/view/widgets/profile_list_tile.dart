import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String leadindIcon;
  final VoidCallback onTap;

  const ProfileListTile({super.key, required this.title, required this.leadindIcon, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.containerColor4,
            borderRadius: BorderRadius.circular(8.h),
          ),
          child: ListTile(
            leading: SvgPicture.asset(
              leadindIcon,
              height: 24,
              width: 24,
            ),
            title: Text(title, style:  getRegularStyle16(color: ColorManager.mediumText),),
            trailing: Icon(Icons.arrow_forward_ios,size: 24.h,color: ColorManager.iconColor,),
          ),
        ),
      ),
    );
  }
}