import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/rent_button.dart';
import 'package:rent_camera/app/modules/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: Text(
                  "Let's Get Started",
                  style: h6.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  RentButton.child(
                      onPress: () {},
                      text: 'Facebook',
                      backgroundColor: AppColors.facebookColor),
                  SizedBox(
                    height: 15.h,
                  ),
                  RentButton.child(
                      onPress: () {},
                      text: 'Twitter',
                      backgroundColor: AppColors.twitterColor),
                  SizedBox(
                    height: 15.h,
                  ),
                  RentButton.child(
                      onPress: () {},
                      text: 'Google',
                      backgroundColor: AppColors.googleColor),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: AppColors.c8F959EColor),
                      ),
                      TextButton(
                          onPressed: () {
                            controller.signIn();
                          },
                          child: const Text(
                            'SignIn',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BottomButton.child(
                      text: 'Create an Account',
                      backgroundColor:
                          AppColors.bottomButtonColor.withOpacity(0.76),
                      onTap: () {
                        controller.signUp();
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
