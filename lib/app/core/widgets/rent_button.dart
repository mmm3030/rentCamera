import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';

abstract class RentButton {
  static Widget child({
    required String text,
    double width = double.infinity,
    double height = 50,
    required Color backgroundColor,
    required Function()? onPress,
  }) {
    return _rentButton(text, width, height, backgroundColor, onPress);
  }

  static Widget _rentButton(String text, double width, double height,
      Color backgroundColor, onPress) {
    return Container(
      width: width.w,
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
          ),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(fontSize: 15.sp),
          )),
    );
  }
}
