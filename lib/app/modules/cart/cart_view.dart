import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/core/widgets/card_cart_equipment.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.all(5.r),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                AppAssets.IconBack,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
                fontSize: 20.sp,
                color: const Color(0xFF1D1E20),
                fontWeight: FontWeights.medium),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return controller.fetchCart();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    for (var i = 0;
                        i < controller.mapCartData.value.keys.toList().length;
                        i++)
                      CardCartEquipment.child(
                          productModel:
                              controller.mapCartData.value.values.toList()[i],
                          cartModel:
                              controller.mapCartData.value.keys.toList()[i],
                          onTapDecrease: () {
                            controller.fetchUpdateCart(
                                controller.mapCartData.value.keys.toList()[i],
                                controller.mapCartData.value.values.toList()[i],
                                false);
                          },
                          onTapIncrease: () {
                            controller.fetchUpdateCart(
                                controller.mapCartData.value.keys.toList()[i],
                                controller.mapCartData.value.values.toList()[i],
                                true);
                          },
                          onTapDelete: () {
                            controller.fetchDeleteProductCart(
                                controller.mapCartData.value.keys.toList()[i]);
                          }),
                    SizedBox(
                      height: 30.h,
                    ),
                    titleCart('Delivery Address', () {
                      controller.deliveryAddress();
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.addressController.listAddress.value.isEmpty
                        ? Container()
                        : cardAddress(
                            controller
                                .addressController.primaryAddress.value.street!,
                            controller.addressController.primaryAddress.value
                                .country!),
                    SizedBox(
                      height: 30.h,
                    ),
                    titleCart('Payment Method', () {
                      controller.cardCredit();
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    controller.cardController.listCard.value.isEmpty
                        ? Container()
                        : cardAddress(
                            controller.cardController
                                .getCardCredit()
                                .cardHolderName!,
                            '**** ${Utils.creditCard(controller.cardController.getCardCredit().cardNumber!)}',
                            isVisa: true),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                              'Order Info',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeights.medium),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    cardOrder('Subtotal', controller.totalPrice),
                    cardOrder('Shipping cost', 10),
                    cardOrder('Total', controller.totalPrice + 10),
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                BottomButton.child(
                    text: 'Checkout',
                    backgroundColor:
                        AppColors.bottomButtonColor.withOpacity(0.76),
                    onTap: () {
                      controller.checkOut();
                    }),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget cardOrder(String text, double number) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: AppColors.c8F959EColor, fontSize: 15.sp),
          ),
          Text(
            "\u0024$number",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeights.medium,
                fontSize: 15.sp),
          )
        ],
      ),
    );
  }

  Widget cardAddress(String text, String subtext, {bool isVisa = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              isVisa
                  ? Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    )
                  : Container(
                      width: 50.w,
                      height: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Image.asset(AppAssets.IconMap),
                    ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeights.medium),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    subtext,
                    style: const TextStyle(color: AppColors.navGray),
                  )
                ],
              ),
            ],
          ),
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 30.sp,
          )
        ],
      ),
    );
  }

  Widget titleCart(String text, Function() onTap) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeights.medium),
          ),
          InkWell(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
