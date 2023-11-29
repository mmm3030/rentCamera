import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/widgets/card_equipment.dart';
import 'package:rent_camera/app/core/widgets/card_project.dart';
import 'package:rent_camera/app/core/widgets/card_services.dart';
import 'package:rent_camera/app/core/widgets/title.dart';
import 'package:rent_camera/app/modules/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.init();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TitleCategory.child(text: 'Equipment Rental', onPress: () {}),
              Container(
                  height: 190.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.products.value.length,
                        itemBuilder: (context, index) {
                          return CardEquipment.child(
                            productModel: controller.products.value[index],
                            onTap: () {
                              controller.cartController.beforeOpenModal(
                                  context, controller.products.value[index]);
                            },
                          );
                        }),
                  )),
              TitleCategory.child(
                  text: 'Services film equipment', onPress: () {}),
              Container(
                height: 290.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.services.value.length,
                      itemBuilder: (context, index) {
                        return CardServices.child(
                            imageUrl: controller.services.value[index].imgUrl,
                            name: controller.services.value[index].name,
                            count: controller.services.value[index].count);
                      }),
                ),
              ),
              TitleCategory.child(text: 'Project', onPress: () {}),
              Container(
                  height: 190.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.projects.value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: CardProject.child(
                              onTap: () {},
                              name: controller.projects.value[index].name,
                              imgUrl: controller.projects.value[index].imgUrl,
                              reviewCount:
                                  controller.projects.value[index].reviewCount,
                              rating: controller.projects.value[index].rating,
                              casting: controller.projects.value[index].casting,
                            ),
                          );
                        }),
                  )),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
