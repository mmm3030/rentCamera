import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/input.dart';
import 'package:rent_camera/app/modules/forgotPassword/forgot_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20.w, top: 20.w),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      AppAssets.IconBack,
                    ),
                  ),
                ),
              ),
              Text(
                "Forgot Password",
                style: h5.copyWith(fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                AppAssets.ImgForgotPassword,
              ),
              SizedBox(
                height: 25.h,
              ),
              InputText.child(
                  text: 'Email Address',
                  controller: controller.email,
                  hintT: 'Enter email address'),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Please write your email to receive a confirmation code to set a new password.',
                  style: TextStyle(color: AppColors.c8F959EColor),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BottomButton.child(
                  text: 'Confirm Email',
                  backgroundColor:
                      AppColors.bottomButtonColor.withOpacity(0.76),
                  onTap: () {
                    controller.confirmEmail();
                  }),
            ],
          ),
        ],
      ),
    ));
  }
}
