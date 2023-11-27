import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/utils/number_utils.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/models/product_model.dart';

abstract class CardEquipment {
  static Widget child({
    required ProductModel productModel,
    bool isNoBorder = false,
    required Function() onTap,
  }) {
    return isNoBorder
        ? _cardEquipmentNoBorder(onTap, productModel)
        : _cardEquipment(onTap, productModel);
  }

  static Widget _cardEquipment(Function() onTap, ProductModel productModel) {
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
              color: Colors.grey,
              blurRadius: 10.0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.w),
              width: 100.w,
              height: 190.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image.network(
                    fit: BoxFit.fitWidth,
                    productModel.images!.first.imageUrl.toString()),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    iconTitle(
                      Icons.star_rate_rounded,
                      '${productModel.averageRating.toDouble()}',
                      false,
                      AppColors.starColor,
                    ),
                    Text(
                      ' (${productModel.totalReviews})',
                      style: const TextStyle(color: AppColors.navGray),
                    ),
                  ],
                ),
                SizedBox(
                    width: 170.w,
                    child: Text(
                      Utils.truncateString(productModel.name.toString(), 45),
                      style:
                          TextStyle(color: AppColors.navGray, fontSize: 15.sp),
                    )),
                iconTitle(Icons.bed, '${productModel.unitsInStock} equipment',
                    false, Colors.black),
                iconTitle(Icons.bed, 'Add to card', true, Colors.black),
                iconTitle(Icons.attach_money_outlined,
                    NumberUtils.vnd(productModel.amount), false, Colors.black),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10.r),
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: AppColors.navGray,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget _cardEquipmentNoBorder(
      Function() onTap, ProductModel productModel) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        height: 190.h,
        width: 310.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.w),
              width: 100.w,
              height: 190.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                ),
                child: Image.network(
                    fit: BoxFit.fitWidth,
                    productModel.images!.first.imageUrl.toString()),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    iconTitle(
                      Icons.star_rate_rounded,
                      '${productModel.averageRating.toDouble()}',
                      false,
                      AppColors.starColor,
                    ),
                    Text(
                      ' (${productModel.totalReviews})',
                      style: const TextStyle(color: AppColors.navGray),
                    ),
                  ],
                ),
                SizedBox(
                    width: 170.w,
                    child: Text(
                      Utils.truncateString(productModel.name.toString(), 45),
                      style:
                          TextStyle(color: AppColors.navGray, fontSize: 15.sp),
                    )),
                iconTitle(Icons.bed, '${productModel.unitsInStock} equipment',
                    false, Colors.black),
                iconTitle(Icons.bed, 'Add to card', true, Colors.black),
                iconTitle(Icons.attach_money_outlined,
                    NumberUtils.vnd(productModel.amount), false, Colors.black),
              ],
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10.r),
              child: const Icon(
                Icons.favorite_outline_rounded,
                color: AppColors.navGray,
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget iconTitle(
      IconData icon, String text, bool isBold, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: TextStyle(
              color: AppColors.navGray,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }
}
