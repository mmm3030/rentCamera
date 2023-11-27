import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/nav_buttom.dart';
import 'package:rent_camera/app/modules/main/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            body: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NavButton.child(
                        text: 'Home',
                        icon: AppAssets.IconHome,
                        onPress: () {
                          controller.changeTab(0);
                        },
                        isActive: controller.currentTab.value == 0),
                    NavButton.child(
                        text: 'Equipment',
                        icon: AppAssets.IconEquipment,
                        onPress: () {
                          controller.changeTab(1);
                        },
                        isActive: controller.currentTab.value == 1),
                    NavButton.child(
                        text: 'Contact',
                        icon: AppAssets.IconContact,
                        onPress: () {
                          controller.changeTab(2);
                        },
                        isActive: controller.currentTab.value == 2),
                    NavButton.child(
                        text: 'Login',
                        icon: AppAssets.IconAccount,
                        onPress: () {
                          controller.changeTab(3);
                        },
                        isActive: controller.currentTab.value == 3),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                height: 40.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffF2F2F3),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: SvgPicture.asset(
                        AppAssets.IconSearch,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(
                      width: 240.w,
                      // height: 40.h,
                      child: Center(
                        child: TextField(
                            controller: controller.search,
                            onSubmitted: (value) {
                              controller.searchProduct(value, context);
                            },
                            decoration: const InputDecoration(
                              hintText: 'Search film Equipment ',
                              border: InputBorder.none,
                            )),
                      ),
                    ),
                    const Icon(Icons.filter_alt_rounded, color: Colors.grey),
                  ],
                ),
              ),
              Expanded(
                child: controller.currentScreen,
              )
            ],
          ),
        )),
      ),
    );
  }
}
