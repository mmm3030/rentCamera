import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/card_equipment.dart';
import 'package:rent_camera/app/modules/contact/contact_controller.dart';
import 'package:rent_camera/app/modules/contact/contact_view.dart';
import 'package:rent_camera/app/modules/equipment/equipment_controller.dart';
import 'package:rent_camera/app/modules/equipment/equipment_view.dart';
import 'package:rent_camera/app/modules/home/home_controller.dart';
import 'package:rent_camera/app/modules/home/home_view.dart';
import 'package:rent_camera/app/modules/profile/profile_controller.dart';
import 'package:rent_camera/app/modules/profile/profile_view.dart';

class MainController extends GetxController {
  late HomeController _homeController;
  late EquipmentController _equipmentController;
  // late ProcedureController _procedureController;
  late ContactController _contactController;
  late ProfileController _profileController;
  late CartController _cartController;

  PageStorageBucket bucket = PageStorageBucket();
  var currentTab = 0.obs;

  final List<Widget> _screens = [
    const HomeView(),
    const EquipmentView(),
    const ContactView(),
    const ProfileView(),
  ];
  Widget get currentScreen => _screens[currentTab.value];

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

    // Get.put(
    //   ProcedureController(),
    //   permanent: true,
    // );
    // _procedureController = Get.find<ProcedureController>();
    // _procedureController.init();

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
  }

  @override
  Future<void> onInit() async {
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

  void searchProduct(value, BuildContext context) {
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
                          'Showing 10 results',
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container();
                          // return CardEquipment.child(
                          //   onTap: () {},
                          // );
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
}
