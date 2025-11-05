import 'package:chatterstick_streaming_app/core/resource/constansts/color_manger.dart';
import 'package:chatterstick_streaming_app/core/resource/style_manager.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/middle_back_header.dart';
import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/sign_up/viewmodel/auth_provider.dart';
import '../viewmodel/change_old_password_viewmodel.dart';

class ChangeOldPasswordScreen extends ConsumerStatefulWidget {
  const ChangeOldPasswordScreen({super.key});

  @override
  ConsumerState<ChangeOldPasswordScreen> createState() =>
      _ChangeNewPasswordScreenState();
}

class _ChangeNewPasswordScreenState
    extends ConsumerState<ChangeOldPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController =
      TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isCurrentObscure = ref.watch(authProvider).isCurrentObscure;
    final isNewObscure = ref.watch(authProvider).isNewObscure;
    final isConfirmNewObscure = ref.watch(authProvider).isConfirmNewObscure;
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
                SizedBox(height: 20.h),
                TextFormField(
                  controller: _passwordController,
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  obscureText: isCurrentObscure,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),
                TextFormField(
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  obscureText: isNewObscure,
                  controller: _newPasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'New password',
                    hintStyle: getRegularStyle16(color: ColorManager.hintText),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        ref.read(authProvider.notifier).toggleNewObscure();
                      },
                      child: Icon(
                        isNewObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24.h,
                        color: ColorManager.iconColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 12.h),
                TextFormField(
                  style: getRegularStyle16(color: ColorManager.mediumText),
                  obscureText: isConfirmNewObscure,
                  controller: _confirmNewPasswordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Confirm New password',
                    hintStyle: getRegularStyle16(color: ColorManager.hintText),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        ref.read(authProvider.notifier).toggleConfirmNewObscure();
                      },
                      child: Icon(
                        isConfirmNewObscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 24.h,
                        color: ColorManager.iconColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    } else if (value != _newPasswordController.text) {
                      return 'Passwords do not match';
                    } else {
                      return null;
                    }
                  },
                ),
                Spacer(),
                PrimaryButton(
                  title: 'Create new password',
                  width: double.infinity,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final res = await ref
                          .read(changePasswordProvider.notifier)
                          .changePassword(
                            oldPassword: _passwordController.text.trim(),
                            newPassword: _newPasswordController.text.trim(),
                          );

                      if(res){
                        Navigator.pop(context);
                      } else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Something went wrong'),
                          ),
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
