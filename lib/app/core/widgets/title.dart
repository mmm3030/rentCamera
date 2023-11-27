import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';

abstract class TitleCategory {
  static Widget child({required String text, required Function()? onPress}) {
    return _title(text, onPress);
  }

  static Widget _title(String text, Function()? onPress) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: h6.copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
          TextButton(onPressed: onPress, child: const Text('See all'))
        ],
      ),
    );
  }
}
