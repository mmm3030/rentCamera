import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/widgets/card_equipment.dart';
import 'package:rent_camera/app/core/widgets/title.dart';
import 'package:rent_camera/app/modules/equipment/equipment_controller.dart';

class EquipmentView extends GetView<EquipmentController> {
  const EquipmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < controller.categories.value.length; i++)
              Column(
                children: [
                  TitleCategory.child(
                      text: controller.categories.value[i].name!,
                      onPress: () {}),
                  Container(
                    height: 190.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          print(controller.getProductByCategory(i).toString());
                          return Container();
                          // return CardEquipment.child(
                          //   onTap: () {},
                          // );
                        }),
                  ),
                ],
              ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}
