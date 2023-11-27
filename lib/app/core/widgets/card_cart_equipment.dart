import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/models/product_model.dart';

abstract class CardCartEquipment {
  static Widget child({
    required ProductModel productModel,
    required Function() onTap,
  }) {
    return _cardCartEquipment(onTap, productModel);
  }

  static Widget _cardCartEquipment(
      Function() onTap, ProductModel productModel) {
    return InkWell(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                )
              ],
            ),
            child: Row(
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
                        fit: BoxFit.fitHeight,
                        productModel.images!.first.imageUrl.toString()),
                  ),
                ),
                Container(
                  width: 190.w,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 150.w,
                          child: Text(
                            productModel.name!,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF7D7F88),
                                fontWeight: FontWeights.medium),
                          )),
                      Text(
                        "\u0024${productModel.amount} ",
                        //(-\u00244.000.000 Tax)
                        style: const TextStyle(color: Color(0xFF7D7F88)),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_circle_down_sharp,
                              size: 30.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Text(
                              '1',
                              style: TextStyle(fontSize: 18.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_circle_up_sharp,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.all(10.r),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.delete,
                      size: 30.sp,
                    ),
                  ),
                ),
              ],
            )));
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
