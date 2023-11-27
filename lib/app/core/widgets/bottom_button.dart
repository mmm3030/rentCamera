import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';

abstract class BottomButton {
  static Widget child({
    required String text,
    double width = double.infinity,
    double height = 60,
    Color backgroundColor = AppColors.bottomButtonColor,
    required Function()? onTap,
  }) {
    return _bottomButton(text, width, height, backgroundColor, onTap);
  }

  static Widget _bottomButton(
      String text, double width, double height, Color backgroundColor, onTap) {
    return Container(
      width: width.w,
      height: height.h,
      color: backgroundColor,
      child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeights.bold),
            ),
          )),
    );
  }
}
