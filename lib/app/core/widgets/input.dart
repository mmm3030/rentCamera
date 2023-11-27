import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';

abstract class InputText {
  static Widget child({
    required String text,
    TextEditingController? controller,
    String hintT = '',
    bool hidden = false,
  }) {
    return _inputText(text, hintT, controller, hidden);
  }

  static Widget _inputText(String text, String hintT,
      TextEditingController? controller, bool hidden) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: const TextStyle(color: AppColors.c8F959EColor)),
          TextField(
              controller: controller,
              cursorColor: AppColors.c8F959EColor,
              obscureText: hidden,
              decoration: InputDecoration(
                hintText: hintT,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.c8F959EColor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.bottomButtonColor),
                ),
              ))
        ],
      ),
    );
  }
}
