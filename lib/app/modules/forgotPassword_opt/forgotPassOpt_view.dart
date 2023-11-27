import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/input.dart';
import 'package:rent_camera/app/core/widgets/opt_input.dart';
import 'package:rent_camera/app/modules/forgotPassword_opt/forgotPassOpt_controller.dart';

class ForgotPasswordOptView extends GetView<ForgotPasswordOptController> {
  const ForgotPasswordOptView({super.key});

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
                "Verification Code",
                style: h5.copyWith(fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                AppAssets.ImgForgotPassword,
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Form(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OptInput.child(
                        context: context, controller: controller.pin1),
                    OptInput.child(
                        context: context, controller: controller.pin2),
                    OptInput.child(
                        context: context, controller: controller.pin3),
                    OptInput.child(
                        context: context, controller: controller.pin4),
                    OptInput.child(
                        context: context, controller: controller.pin5),
                    OptInput.child(
                        context: context, controller: controller.pin6),
                  ],
                )),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: const Text(
                  textAlign: TextAlign.center,
                  '00:20 resend confirmation code.',
                  style: TextStyle(color: AppColors.c8F959EColor),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              BottomButton.child(
                  text: 'Confirm Code',
                  backgroundColor:
                      AppColors.bottomButtonColor.withOpacity(0.76),
                  onTap: () {
                    controller.confirmCode();
                  }),
            ],
          ),
        ],
      ),
    ));
  }
}
