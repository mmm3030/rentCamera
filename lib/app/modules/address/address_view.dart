import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/core/widgets/bottom_button.dart';
import 'package:rent_camera/app/modules/address/address_controller.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomButton.child(
            text: 'Save Address',
            backgroundColor: AppColors.bottomButtonColor.withOpacity(0.76),
            onTap: () {}),
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
            'Address',
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
              textInputField('Name', controller.nameController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150.w,
                    child:
                        textInputField('Country', controller.countryController),
                  ),
                  SizedBox(
                    width: 150.w,
                    child: textInputField('City', controller.cityController),
                  ),
                ],
              ),
              textInputField('Phone Number', controller.phoneNumber),
              textInputField('Address', controller.addressController),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Save as primary address',
                    style: TextStyle(
                        fontWeight: FontWeights.medium, fontSize: 18.sp),
                  ),
                  Obx(() => CupertinoSwitch(
                        value: controller.setPrimaryAddress.isTrue,
                        activeColor: Colors.green,
                        onChanged: (bool value) {
                          controller.setPrimaryAddress.value = value;
                        },
                      )),
                ],
              )
            ],
          ),
        ),
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
