import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';

abstract class NavButton {
  static Widget child(
      {required String text,
      required String icon,
      required Function()? onPress,
      required bool isActive}) {
    return _navButton(text, icon, onPress, isActive);
  }

  static Widget _navButton(
      String text, String icon, Function()? onPress, bool isActive) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          SizedBox(width: 30.w, height: 30.h, child: Image.asset(icon)),
          SizedBox(
            height: 5.h,
          ),
          Text(
            text,
            style: TextStyle(
                fontWeight: isActive ? FontWeights.bold : FontWeights.medium,
                color: isActive ? Colors.black : AppColors.navGray),
          )
        ],
      ),
    );
  }
}
