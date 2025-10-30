import 'package:chatterstick_streaming_app/core/route/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constansts/app_colors.dart';
import '../../core/constansts/app_icons.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: style.titleSmall?.copyWith(
            color: AppColors.titleText,
            fontWeight: FontWeight.w700,
              fontSize: 20.sp
          ),
        ),
        GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, RouteName.notificationScreen);
            },
            child: SvgPicture.asset(AppIcons.notificationSvg, width: 24.w, height: 24.h)),
      ],
    );
  }
}
