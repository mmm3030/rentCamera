import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/date_time_utils.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/card_equipment.dart';
import 'package:rent_camera/app/core/widgets/rent_button.dart';
import 'package:rent_camera/app/models/cart_model.dart';
import 'package:rent_camera/app/models/product_model.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  late Rx<List<CartModel>> carts = Rx([]);
  
  var count = 1.obs;
  var dateStart = ''.obs;
  var dateEnd = ''.obs;
  void increase() {
    count++;
  }

  void decrease() {
    if (count.value == 0) {
      return;
    }
    count--;
  }

  Future<void> fetchListProduct() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/CartItems"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<CartModel> cartList = [];
      for (var p in result) {
        CartModel cart = CartModel.fromJson(p);
        cartList.add(cart);
      }
      carts(cartList);
    } else {
      Utils.handleError401();
    }
    update();
  }

  Future<void> showDate(BuildContext context) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      cancelText: 'Huỷ',
      saveText: 'Lưu',
      helpText: 'Chọn ngày thuê',
    );
    if (newDateRange == null) return;
    dateStart.value = DateTimeUtils.dateTimeToString(newDateRange.start);
    dateEnd.value = DateTimeUtils.dateTimeToString(newDateRange.end);
  }

  void addToCart() {
    Get.toNamed(Routes.CART);
  }

  void deliveryAddress() {
    Get.toNamed(Routes.ADDRESS);
  }

  void checkOut() {
    // Get.toNamed(Routes.CHECKOUT);
  }

  void openDetailProduct(BuildContext context, ProductModel productModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(),
                  CardEquipment.child(
                    isNoBorder: true,
                    productModel: productModel,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: const Text(
                            'Rental date',
                            style: TextStyle(color: Color(0xFF8F959E)),
                          ),
                        ),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${dateStart.value} - ${dateEnd.value}"),
                              InkWell(
                                  onTap: () {
                                    showDate(context);
                                  },
                                  child:
                                      const Icon(Icons.calendar_today_rounded))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.w,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: const Text(
                            'Amount',
                            style: TextStyle(color: Color(0xFF8F959E)),
                          ),
                        ),
                        Obx(
                          () => Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  decrease();
                                },
                                child: Icon(
                                  Icons.arrow_circle_down_sharp,
                                  size: 30.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  count.value.toString(),
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  increase();
                                },
                                child: Icon(
                                  Icons.arrow_circle_up_sharp,
                                  size: 30.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Text(
                            'Description',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeights.medium,
                                fontSize: 15.sp),
                          ),
                        ),
                        ReadMoreText(productModel.description!,
                            trimLines: 3,
                            colorClickableText: Colors.black,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: 'Hide less',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeights.regular,
                                color: const Color(0xFF8F959E)),
                            moreStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeights.bold,
                              color: Colors.black,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeights.medium,
                                      fontSize: 15.sp),
                                ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                      color: const Color(0xFF8F959E),
                                      fontWeight: FontWeights.regular,
                                      fontSize: 15.sp),
                                ),
                              ],
                            )),
                        Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'Ronald Richards',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeights.medium),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          const Text(
                                            '🕐 13 Sep, 2020',
                                            style: TextStyle(
                                                color: Color(0xff8F959E),
                                                fontWeight:
                                                    FontWeights.regular),
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
                                            '4.8',
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
                                                fontWeight:
                                                    FontWeights.regular),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_rounded,
                                              size: 18.sp,
                                              color: const Color(0xFFFF981F)),
                                          Icon(Icons.star_rounded,
                                              size: 18.sp,
                                              color: const Color(0xFFFF981F)),
                                          Icon(Icons.star_rounded,
                                              size: 18.sp,
                                              color: const Color(0xFFFF981F)),
                                          Icon(Icons.star_rounded,
                                              size: 18.sp,
                                              color: const Color(0xFFFF981F)),
                                          Icon(Icons.star_border_rounded,
                                              size: 18.sp,
                                              color: const Color(0xFF8F959E)),
                                        ],
                                      )
                                    ],
                                  )
                                ]),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque malesuada eget vitae amet...',
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: const Color(0xff8F959E),
                                  fontWeight: FontWeights.regular),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        Row(
                          children: [
                            RentButton.child(
                                text: 'Chat',
                                backgroundColor: const Color(0xFF0C86F6),
                                width: 150.w,
                                onPress: () {}),
                            RentButton.child(
                                text: 'Add to cart',
                                backgroundColor: const Color(0xFFFF7F00),
                                width: 150.w,
                                onPress: () {
                                  addToCart();
                                }),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
