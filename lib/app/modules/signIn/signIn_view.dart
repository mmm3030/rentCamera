import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/input.dart';
import 'package:rent_camera/app/modules/signIn/signIn_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.w, top: 20.w),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        AppAssets.IconBack,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        children: [
                          Text(
                            "Welcome",
                            style: h5.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Please enter your data to continue",
                            style: TextStyle(
                                color: AppColors.c8F959EColor,
                                fontWeight: FontWeights.medium),
                          ),
                        ],
                      )),
                ],
              ),
              Column(
                children: [
                  InputText.child(
                      text: 'Username',
                      controller: controller.usernameController,
                      hintT: 'Enter user name'),
                  SizedBox(
                    height: 30.h,
                  ),
                  InputText.child(
                      text: 'Password',
                      controller: controller.passwordController,
                      hidden: true,
                      hintT: 'Enter password'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          controller.forgotPassword();
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeights.medium),
                          textAlign: TextAlign.right,
                        ),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Remember me',
                          style: TextStyle(
                              color: AppColors.c1D1E20Color,
                              fontWeight: FontWeights.regular),
                        ),
                        Obx(
                          () => CupertinoSwitch(
                            value: controller.switchButton.isTrue,
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              controller.switchButton.value = value;
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              BottomButton.child(
                  text: 'Login',
                  backgroundColor:
                      AppColors.bottomButtonColor.withOpacity(0.76),
                  onTap: () {
                    controller.login();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
