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
import 'package:rent_camera/app/core/widgets/card_review.dart';
import 'package:rent_camera/app/core/widgets/rent_button.dart';
import 'package:rent_camera/app/models/cart_model.dart';
import 'package:rent_camera/app/models/product_model.dart';
import 'package:rent_camera/app/models/review_model.dart';
import 'package:rent_camera/app/modules/address/address_controller.dart';
import 'package:rent_camera/app/modules/card/card_controller.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  late Rx<Map<CartModel, ProductModel>> mapCartData = Rx({});
  late AddressController addressController = Get.put(AddressController());
  late CardController cardController = Get.put(CardController());
  late Rx<List<ReviewModel>> listReview = Rx([]);
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

  @override
  void onInit() {
    fetchCart();
    super.onInit();
  }

  get totalPrice {
    var total = 0.0;
    mapCartData.value.forEach((key, value) {
      total += key.quantity! * value.amount!;
    });
    return total;
  }

  void getProductByProductId(int productId) {}

  Future<void> fetchUpdateCart(
      CartModel cartModel, ProductModel productModel, bool isIncrease) async {
    var prefs = await SharedPreferences.getInstance();
    int newQuantity =
        isIncrease ? cartModel.quantity! + 1 : cartModel.quantity! - 1;
    String? token = prefs.getString('token');
    final response = await http.put(
        Uri.parse("${Constants.baseUrl}/Users/CartItems/${cartModel.id}"),
        headers: Constants.header(token!),
        body: jsonEncode({
          "id": cartModel.id,
          "quantity": newQuantity,
          "startDate": cartModel.startDate,
          "endDate": cartModel.endDate,
        }));
    if (response.statusCode == 200) {
      await fetchCart();
    } else if (response.statusCode == 400) {}
    update();
  }

  Future<void> fetchDeleteProductCart(CartModel cartModel) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.delete(
      Uri.parse("${Constants.baseUrl}/Users/CartItems/${cartModel.id}"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      await fetchCart();
    } else if (response.statusCode == 400) {}
    update();
  }

  Future<void> fetchAddToCart(ProductModel productModel) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}/Users/CartItems"),
      headers: Constants.header(token!),
      body: jsonEncode({
        "quantity": count.value,
        "startDate": DateTimeUtils.stringToDateTime(dateStart.value),
        "endDate": DateTimeUtils.stringToDateTime(dateEnd.value),
        "productId": productModel.id,
      }),
    );
    if (response.statusCode == 200) {
      await fetchCart();
      Get.toNamed(Routes.CART);
    } else if (response.statusCode == 400) {
      Utils.toast('Notification',
          'The product has been in your cart during this period!');
    }
    update();
  }

  Future<void> fetchCart() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/CartItems"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      Map<CartModel, ProductModel> mapDataTmp = {};
      for (var p in result) {
        CartModel cart = CartModel.fromJson(p);
        mapDataTmp[cart] = await getProductsByProductId(cart.productId!);
      }
      mapCartData(mapDataTmp);
    } else {}
    update();
  }

  Future<ProductModel> getProductsByProductId(int id) async {
    late ProductModel products = ProductModel();
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Products/$id"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      products = ProductModel.fromJson(result);
    } else {}
    update();
    return products;
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

  Future<void> addToCart(ProductModel productModel) async {
    await fetchAddToCart(productModel);
  }

  void deliveryAddress() {
    Get.toNamed(Routes.ADDRESS);
  }

  void cardCredit() {
    CardController().onInit();
    Get.toNamed(Routes.CARD);
  }

  void checkOut() {
    // print(cardController.listCard.value.isEmpty);
    // Get.toNamed(Routes.CHECKOUT);
    // fetchCheckOut();
  }

  Future<void> fetchCheckOut() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Users/Bookings"),
            headers: Constants.header(token!),
            body: jsonEncode({
              "addressId": addressController.primaryAddress.value.id,
              "creditCardId": cardController.listCard.value.first.id
            }));
    if (response.statusCode == 200) {
      // Get.toNamed(Routes.CHECKOUT);
    } else {
      // Get.toNamed(Routes.CHECKOUT);
    }
    update();
  }

  Future<void> fetchReview(ProductModel productModel) async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Products/${productModel.id}/Reviews"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> data = result['contends'];
      List<ReviewModel> listReviewTmp = [];
      for (var p in data) {
        ReviewModel reviewModel = ReviewModel.fromJson(p);
        listReviewTmp.add(reviewModel);
      }
      listReview(listReviewTmp);
    } else {}
    update();
  }

  Future<void> beforeOpenModal(
      BuildContext context, ProductModel productModel) async {
    count.value = 1;
    await fetchReview(productModel);
    openDetailProduct(Get.context!, productModel);
  }

  Future<void> openDetailProduct(
      BuildContext context, ProductModel productModel) async {
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
                        for (var i = 0; i < listReview.value.length; i++)
                          CardReview.child(reviewModel: listReview.value[i]),
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
                                  addToCart(productModel);
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
