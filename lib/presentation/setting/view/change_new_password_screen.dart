import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/middle_back_header.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/sign_up/viewmodel/auth_provider.dart';

class ChangeNewPasswordScreen extends ConsumerStatefulWidget {
  const ChangeNewPasswordScreen({super.key});

  @override
  ConsumerState<ChangeNewPasswordScreen> createState() =>
      _ChangeNewPasswordScreenState();
}

class _ChangeNewPasswordScreenState extends ConsumerState<ChangeNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _formKey.currentState?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isCurrentObscure = ref.watch(authProvider).isCurrentObscure;
    final isNewObscure = ref.watch(authProvider).isNewObscure;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                MiddleBackHeader(title: 'New password'),
                SizedBox(height: 24.h),
                Text(
                  "Enter first enter the current password and then your new password.",
                  style: getRegularStyle16(color: ColorManager.subtitleText1),
                ),
                SizedBox(height: 20.h,),
                TextFormField(
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  obscureText: isCurrentObscure,
                  decoration: InputDecoration(
                    hintText: 'Current password',
                    hintStyle: getRegularStyle16(color: ColorManager.hintText),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        ref.read(authProvider.notifier).toggleCurrentObscure();
                      },
                      child: Icon(
                        isCurrentObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24.h,
                        color: ColorManager.iconColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h,),
                TextFormField(
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  decoration: InputDecoration(
                    hintText: 'New password',
                    hintStyle: getRegularStyle16(color: ColorManager.hintText),
                  ),
                ),
                Spacer(),
                PrimaryButton(title: 'Create new password', width: double.infinity, onTap: (){
                  Navigator.pop(context);
                }),
                SizedBox(height: 24.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
