import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constansts/app_colors.dart';
import '../../core/utils/utils.dart';


class PrimaryButton extends StatelessWidget {
  final String title;
  final double? borderRadius;
  final void Function()? onTap;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  final Color? containerColor;
  final Border? border;
  const PrimaryButton({
    super.key,
    this.borderRadius,
    required this.title,
    required this.onTap,
    this.width,
    this.padding,
    this.textStyle,
    this.containerColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 112.w,

        padding: padding ?? EdgeInsets.all(Utils.isTablet(context) ? 20 : 16.h),

        // padding ?? EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          color: containerColor ?? AppColors.primary,
          border: border ?? Border.all(color: AppColors.transparentColor),
        ),
        child: Center(
          child: Text(
            title,
            style:
                textStyle ??
                style.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                    fontSize: 16.sp
                ),
          ),
        ),
      ),
    );
  }
}
