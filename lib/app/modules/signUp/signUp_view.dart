import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/input.dart';
import 'package:rent_camera/app/modules/signUp/signUp_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomButton.child(
            text: 'Sign Up',
            backgroundColor: AppColors.bottomButtonColor.withOpacity(0.76),
            onTap: () {
              controller.createAccount();
            }),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
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
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "Sign Up",
                        style: h5.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.h,
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
                      height: 30.h,
                    ),
                    InputText.child(
                        text: 'Email Address',
                        controller: controller.emailController,
                        hintT: 'Enter email'),
                    SizedBox(
                      height: 40.h,
                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
