import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';

abstract class CardProject {
  static Widget child({
    required String? name,
    required String? imgUrl,
    required String? reviewCount,
    required String? rating,
    required String? casting,
    required Function() onTap,
  }) {
    return _cardProject(name, imgUrl, reviewCount, rating, casting, onTap);
  }

  static Widget _cardProject(String? name, String? imgUrl, String? reviewCount,
      String? rating, String? casting, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        height: 190.h,
        width: 310.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, //New
              blurRadius: 10.0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 120.w,
              height: 190.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image.network(fit: BoxFit.fitHeight, imgUrl!),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                color: AppColors.starColor,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                rating!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeights.medium),
                              ),
                            ],
                          ),
                          Text(
                            ' ($reviewCount)',
                            style: const TextStyle(color: AppColors.navGray),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 170.w,
                          child: Text(
                            Utils.truncateString(name!, 45),
                            style:
                                TextStyle(color: Colors.black, fontSize: 17.sp),
                          )),
                    ],
                  ),
                  SizedBox(
                      width: 170.w,
                      child: Text(
                        Utils.truncateString('Diễn Viên: $casting', 45),
                        style: TextStyle(
                            color: AppColors.navGray, fontSize: 15.sp),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
