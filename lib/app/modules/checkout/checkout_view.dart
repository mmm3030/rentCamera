import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/modules/checkout/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomButton.child(
            text: 'Continue Rent',
            backgroundColor: AppColors.bottomButtonColor,
            onTap: () {
              controller.continueRent();
            }),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(5.r),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  // color: Colors.blue,
                  width: double.infinity,
                  height: 500.h,
                  child: Image.asset(
                    AppAssets.OrderBackground1,
                    // scale: ,
                    fit: BoxFit.fitWidth,
                    // height: 500,
                  ),
                ),
                Positioned( 
                    left: 0,
                    right: 0,
                    child: Image.asset(AppAssets.OrderBackground2)),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: 30.h,
                      // ),
                      Text(
                        'Order Confirmed!',
                        style: TextStyle(
                            fontWeight: FontWeights.bold, fontSize: 30.sp),
                      ),
                      Text(
                        'Your order has been confirmed, we will send you confirmation email shortly.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeights.regular,
                            fontSize: 15.sp,
                            color: AppColors.c8F959EColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
