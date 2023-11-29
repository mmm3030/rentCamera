import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/card_equipment.dart';
import 'package:rent_camera/app/models/product_model.dart';
import 'package:rent_camera/app/models/profile_model.dart';
import 'package:rent_camera/app/models/project_models.dart';
import 'package:rent_camera/app/modules/address/address_controller.dart';
import 'package:rent_camera/app/modules/contact/contact_controller.dart';
import 'package:rent_camera/app/modules/contact/contact_view.dart';
import 'package:rent_camera/app/modules/equipment/equipment_controller.dart';
import 'package:rent_camera/app/modules/equipment/equipment_view.dart';
import 'package:rent_camera/app/modules/home/home_controller.dart';
import 'package:rent_camera/app/modules/home/home_view.dart';
import 'package:rent_camera/app/modules/profile/profile_controller.dart';
import 'package:rent_camera/app/modules/profile/profile_view.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController with StateMixin {
  getData() async {
    change(null, status: RxStatus.loading());
    await HomeController().init();
    change(null, status: RxStatus.success());
  }

  late HomeController _homeController;
  late EquipmentController _equipmentController;
  // late ProcedureController _procedureController;
  late ContactController _contactController;
  late ProfileController _profileController;
  late CartController _cartController;
  late AddressController _addressController;
  late CartController cartController = Get.put(CartController());
  late Rx<ProfileModel> profile = Rx(ProfileModel());
  late Rx<List<ProductModel>> products = Rx([]);
  PageStorageBucket bucket = PageStorageBucket();
  var currentTab = 0.obs;
  var isAuthentication = false.obs;
  bool isLogin = false;
  final List<Widget> _screens = [
    const HomeView(),
    const EquipmentView(),
    const ContactView(),
    const ProfileView(),
  ];
  Widget get currentScreen => _screens[currentTab.value];

  get isAuth => isAuthentication.value;

  void initController() {
    Get.put(
      HomeController(),
      permanent: true,
    );
    _homeController = Get.find<HomeController>();
    _homeController.init();

    Get.put(
      EquipmentController(),
      permanent: true,
    );
    _equipmentController = Get.find<EquipmentController>();
    _equipmentController.init();

    Get.put(
      ContactController(),
      permanent: true,
    );
    _contactController = Get.find<ContactController>();
    _contactController.init();

    Get.put(
      ProfileController(),
      permanent: true,
    );
    _profileController = Get.find<ProfileController>();
    _profileController.init();

    Get.put(
      CartController(),
      permanent: true,
    );
    _cartController = Get.find<CartController>();
    _cartController.onInit();

    Get.put(
      AddressController(),
      permanent: true,
    );
    _addressController = Get.find<AddressController>();
    _addressController.onInit();
  }

  @override
  Future<void> onInit() async {
    bool isAuth = await Utils.checkTokenValid();
    if (isAuth) {
      isAuthentication.value = isAuth;
      isLogin = isAuth;
      fetchProfile();
    }
    getData();
    initController();
    super.onInit();
  }

  void changeTab(int index) {
    currentTab.value = index;
    switch (index) {
      case 0:
        _homeController.init();
        break;
      case 1:
        _equipmentController.init();
        break;
      case 2:
        _contactController.init();
        break;
      case 3:
        _profileController.init();
        break;
    }
  }

  TextEditingController search = TextEditingController();

  Future<void> searchProduct(value, BuildContext context) async {
    await fetchSearchProduct(value);

    // ignore: use_build_context_synchronously
    showModalBottomSheet<void>(
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
          child: SizedBox(
            // height: double.infinity,
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        width: 3,
                        color: AppColors.foundationD6D6D6,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    margin: EdgeInsets.only(top: 15.h, bottom: 30.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Showing ${products.value.length} results',
                          style: h6.copyWith(fontSize: 15.sp),
                        ),
                        const Row(
                          children: [
                            Icon(Icons.filter_list),
                            Text(
                              'Sort',
                              style: TextStyle(
                                  color: AppColors.foundationColor,
                                  fontWeight: FontWeights.medium),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                        scrollDirection: Axis.vertical,
                        itemCount: products.value.length,
                        itemBuilder: (context, index) {
                          return CardEquipment.child(
                            productModel: products.value[index],
                            onTap: () {
                              cartController.beforeOpenModal(
                                  context, products.value[index]);
                            },
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    search.text = '';
  }

  Future<void> fetchProfile() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/Profile"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      profile(ProfileModel.fromJson(result));
    } else {}
    update();
  }

  Future<void> fetchSearchProduct(String keyword) async {
    final response = await http.get(
        Uri.parse(
            "${Constants.baseUrl}/Products?sort=averageRating%2Cdesc&Search=$keyword"),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> data = result['contends'];
      List<ProductModel> productList = [];
      for (var p in data) {
        ProductModel product = ProductModel.fromJson(p);
        productList.add(product);
      }
      products(productList);
    } else {}
    update();
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }
}
