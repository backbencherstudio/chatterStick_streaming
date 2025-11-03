import 'package:chatterstick_streaming_app/data/models/notification_model.dart';
import 'package:chatterstick_streaming_app/presentation/notification/view/widgets/custom_notification.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/middle_back_header.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              MiddleBackHeader(title: 'Notifications'),
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
