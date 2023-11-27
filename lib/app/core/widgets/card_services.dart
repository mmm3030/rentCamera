import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';

abstract class CardServices {
  static Widget child(
      {required String? imageUrl, required String? name, required String? count}) {
    return _cardServices(imageUrl, name, count);
  }

  static Widget _cardServices(String? imageUrl, String? name, String? count) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      width: 162.w,
      height: 250.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          )
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: 200.w,
            height: 170.h,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: Image.network(fit: BoxFit.fill, imageUrl!),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Text(
              name!,
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeights.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5.w),
            alignment: Alignment.centerLeft,
            child: Text(
              '$count Booked',
              style: const TextStyle(color: AppColors.navGray),
            ),
          ),
        ],
      ),
    );
  }
}
