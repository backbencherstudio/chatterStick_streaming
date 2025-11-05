import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/custom_header.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewmodel/send_idea_viewmodel.dart';

class SendIdeaScreen extends ConsumerStatefulWidget {
  const SendIdeaScreen({super.key});

  @override
  ConsumerState<SendIdeaScreen> createState() => _SendIdeaScreenState();
}

class _SendIdeaScreenState extends ConsumerState<SendIdeaScreen> {
  final TextEditingController _ideaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _ideaController.dispose();
    _formKey.currentState?.dispose();
  }

  void clear() {
    _ideaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                const CustomHeader(title: 'Drop Your Idea!'),
                SizedBox(height: 24.h),
                Text(
                  maxLines: 4,
                  "Got a hilarious plot, a witty one-liner, or a deep thought for a stick-figure comic? We're listening! Your idea could be the next Chattersticks hit",
                  style: getRegularStyle16(color: ColorManager.mediumText1),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  controller: _ideaController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  maxLines: 7,
                  decoration: InputDecoration(
                    hintText:
                        'Example: The stick figure realizes his dog is made of 2 lines and a circle. Write your amazing comic idea here...',
                    hintStyle: getRegularStyle16(color: ColorManager.hintText),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please write your comic idea';
                    } else if (value.trim().length < 10) {
                      return 'Your idea should be at least 10 characters long';
                    } else if (value.trim().length > 500) {
                      return 'Your idea is too long (max 500 characters)';
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 24.h),
                PrimaryButton(
                  title: 'Submit Idea',
                  width: double.infinity,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final res = await ref
                          .read(sentIdeaProvider.notifier)
                          .createIdea(description: _ideaController.text.trim());

                      if (res) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Idea sent successfully'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Something went wrong')),
                        );
                      }
                    }
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
