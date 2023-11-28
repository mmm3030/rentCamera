import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/utils/date_time_utils.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/models/review_model.dart';

abstract class CardReview {
  static Widget child({required ReviewModel reviewModel}) {
    return _cardReview(reviewModel);
  }

  static Widget _cardReview(ReviewModel reviewModel) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Image.network('${reviewModel.user?.avatarUrl}')),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      reviewModel.user?.fullName.toString() ?? '',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeights.medium),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '🕐 ${DateTimeUtils.stringToDateTimeVer2(reviewModel.createdAt.toString())}',
                      style: const TextStyle(
                          color: Color(0xff8F959E),
                          fontWeight: FontWeights.regular),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      reviewModel.rating.toString(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeights.medium),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    const Text(
                      'rating',
                      style: TextStyle(
                          color: Color(0xff8F959E),
                          fontWeight: FontWeights.regular),
                    ),
                  ],
                ),
                Row(
                  children: [
                    reviewModel.rating >= 1
                        ? Icon(Icons.star_rounded,
                            size: 18.sp, color: const Color(0xFFFF981F))
                        : Icon(Icons.star_border_rounded,
                            size: 18.sp, color: const Color(0xFF8F959E)),
                    reviewModel.rating >= 2
                        ? Icon(Icons.star_rounded,
                            size: 18.sp, color: const Color(0xFFFF981F))
                        : Icon(Icons.star_border_rounded,
                            size: 18.sp, color: const Color(0xFF8F959E)),
                    reviewModel.rating >= 3
                        ? Icon(Icons.star_rounded,
                            size: 18.sp, color: const Color(0xFFFF981F))
                        : Icon(Icons.star_border_rounded,
                            size: 18.sp, color: const Color(0xFF8F959E)),
                    reviewModel.rating >= 4
                        ? Icon(Icons.star_rounded,
                            size: 18.sp, color: const Color(0xFFFF981F))
                        : Icon(Icons.star_border_rounded,
                            size: 18.sp, color: const Color(0xFF8F959E)),
                    reviewModel.rating == 5
                        ? Icon(Icons.star_rounded,
                            size: 18.sp, color: const Color(0xFFFF981F))
                        : Icon(Icons.star_border_rounded,
                            size: 18.sp, color: const Color(0xFF8F959E)),
                  ],
                )
              ],
            )
          ]),
          SizedBox(
            height: 10.h,
          ),
          Text(
            reviewModel.description.toString(),
            style: TextStyle(
                fontSize: 15.sp,
                color: const Color(0xff8F959E),
                fontWeight: FontWeights.regular),
          )
        ],
      ),
    );
  }
}
