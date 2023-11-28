import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/values/text_styles.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/models/card_model.dart';
import 'package:rent_camera/app/modules/card/card_controller.dart';

class CardView extends GetView<CardController> {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomButton.child(
          text: 'Save Card',
          backgroundColor: AppColors.bottomButtonColor,
          onTap: () {
            controller.saveCard();
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
          'Payment',
          style: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xFF1D1E20),
              fontWeight: FontWeights.medium),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Obx(
                () => ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.w,
                  ),
                  itemCount: controller.listCard.value.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Obx(
                        () => cardCredit(controller.listCard.value[index], () {
                              controller.cardSelected.value =
                                  controller.listCard.value[index].id!;
                            }));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                controller.addCard();
              },
              child: Container(
                width: double.infinity,
                height: 50.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: const Color(0xFFF6F2FF),
                  border: Border.all(
                    color: const Color(0xFFFF7F00),
                  ),
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Color(0xFF9775FA),
                    ),
                    Text('Add new card',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF9775FA),
                            fontWeight: FontWeights.medium)),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCredit(CardModel cardModel, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 200.h,
        width: 320.w,
        decoration: BoxDecoration(
            border: Border.all(
                color: controller.cardSelected.value == cardModel.id
                    ? Colors.amber
                    : Colors.transparent,
                width: 2.w),
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cardModel.cardHolderName ?? "",
                    style: h6,
                  ),
                  Text(
                    cardModel.creditCardType!.name ?? "",
                    style: h6,
                  )
                ],
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Text(
                    textAlign: TextAlign.start,
                    Utils.hiddenNumberCard(cardModel.cardNumber ?? ""),
                    style: h6,
                  )),
              Container()
            ]),
          ],
        ),
      ),
    );
  }
}
