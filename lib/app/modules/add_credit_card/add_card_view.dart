import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/modules/add_credit_card/add_card_controller.dart';

class AddCardView extends GetView<AddCardController> {
  const AddCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomButton.child(
          text: 'Add Card',
          backgroundColor: AppColors.bottomButtonColor,
          onTap: () {
            controller.addCard();
          }),
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
          'Add New Card',
          style: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xFF1D1E20),
              fontWeight: FontWeights.medium),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            width: double.infinity,
            height: 70.h,
            child: Obx(
              () => ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
                itemCount: controller.listCreditCard.value.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => InkWell(
                        onTap: () {
                          controller.intSelect.value = index;
                        },
                        child: Container(
                          width: 100.w,
                          height: 50.w,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF5F6FA),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: controller.intSelect.toInt() == index
                                      ? Colors.red
                                      : Colors.transparent)),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              controller.listCreditCard.value[index].name!,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeights.medium),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                textInputField('Card Owner', controller.nameController),
                textInputField('Card Number', controller.cardNumberController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: textInputField('EXP', controller.dateController),
                    ),
                    SizedBox(
                      width: 150.w,
                      child: textInputField('CVV', controller.cvvController),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textInputField(String text, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeights.medium, fontSize: 18.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
          ),
        ],
      ),
    );
  }
}
