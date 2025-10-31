import 'dart:developer';

import 'package:chatterstick_streaming_app/presentation/widgets/primery_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resource/constansts/color_manger.dart';
import '../../core/route/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _formKey.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // InkWell(
                //   onTap: () => Navigator.pop(context),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.arrow_back_ios_new,
                //         size: 20.sp,
                //         color: AppColors.mediumText,
                //       ),
                //       SizedBox(width: 5.w),
                //       Text(
                //         'Back',
                //         style: style.bodyMedium?.copyWith(
                //           color: AppColors.mediumText,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 20.h),
                Text(
                  'Log in to your\naccount',
                  style: style.headlineLarge?.copyWith(
                    color: ColorsManager.mediumText,
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                  ),
                ),

                SizedBox(height: 20.h),
                TextFormField(
                  style: style.bodyMedium?.copyWith(
                    color: ColorsManager.mediumText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: style.bodyMedium?.copyWith(
                      color: ColorsManager.hintText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !EmailValidator.validate(_emailController.text)) {
                      return 'Please enter your email address';
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 12.h),

                TextFormField(
                  style: style.bodyMedium?.copyWith(
                    color: ColorsManager.mediumText,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                  controller: _passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: style.bodyMedium?.copyWith(
                      color: ColorsManager.hintText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                    suffixIcon: Icon(
                      Icons.visibility_off_outlined,
                      size: 24.h,
                      color: ColorsManager.mediumText,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Please enter your password';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16.h),

                GestureDetector(
                  onTap: () {
                    log('Forgot password');
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot password',
                      style: style.bodyMedium?.copyWith(
                        color: ColorsManager.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),

                Spacer(),
                PrimaryButton(
                  title: 'Login',
                  width: double.infinity,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      log('Login');
                      Navigator.pushNamed(context, RouteName.bottomNavBar);
                    }
                  },
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: style.bodyMedium?.copyWith(
                        color: ColorsManager.subtitleText1,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sign up',
                        style: style.bodyMedium?.copyWith(
                          color: ColorsManager.mediumText,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
