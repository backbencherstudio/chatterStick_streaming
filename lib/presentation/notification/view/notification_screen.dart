import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/data/models/notification_model.dart';
import 'package:chatterstick_streaming_app/presentation/notification/view/widgets/custom_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 20.sp,
                            color: ColorsManager.mediumText,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Back',
                            style: style.bodyMedium?.copyWith(
                              color: ColorsManager.mediumText,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Text(
                    'Notifications',
                    textAlign: TextAlign.center,
                    style: style.bodyMedium?.copyWith(
                      color: ColorsManager.titleText,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(notifications.length, (context) {
                        final notification = notifications[context];
                        return CustomNotification(
                          title: notification.title,
                          message: notification.message,
                          timeAgo: notification.timeAgo,
                          isRead: notification.isRead,
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
