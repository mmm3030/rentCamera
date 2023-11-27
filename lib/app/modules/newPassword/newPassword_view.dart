import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/input.dart';
import 'package:rent_camera/app/modules/newPassword/newPassword_controller.dart';

class NewPasswordView extends GetView<NewPassWordController> {
  const NewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                "New Password",
                style: h5.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25.h,
              ),
            ],
          ),
          Column(
            children: [
              InputText.child(
                  text: 'Password',
                  controller: controller.passwordController,
                  hintT: 'Enter password'),
              SizedBox(
                height: 30.h,
              ),
              InputText.child(
                  text: 'Confirm Password',
                  controller: controller.passwordController,
                  hintT: 're-enter Password'),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Please write your new password.',
                  style: TextStyle(color: AppColors.c8F959EColor),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BottomButton.child(
                  text: 'Reset Password',
                  backgroundColor:
                      AppColors.bottomButtonColor.withOpacity(0.76),
                  onTap: () {
                    controller.resetPassword();
                  }),            ],
          ),
        ],
      ),
    ));
  }
}
