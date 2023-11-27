import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';

abstract class OptInput {
  static Widget child({
    required BuildContext context,
    required TextEditingController controller,
  }) {
    return _optInput(context, controller);
  }

  static Widget _optInput(
      BuildContext context, TextEditingController controller) {
    return Container(
      width: 40.w,
      height: 60.h,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          cursorColor: AppColors.c8F959EColor,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ),
      ),
    );
  }
}
