import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/date_time_utils.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/core/utils/number_utils.dart';
import 'package:rent_camera/app/core/values/app_assets.dart';
import 'package:rent_camera/app/core/values/font_weights.dart';
import 'package:rent_camera/app/modules/history/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
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
                'History',
                style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFF1D1E20),
                    fontWeight: FontWeights.medium),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        headerContainer('Tổng tiền giao dịch',
                            '${NumberUtils.vnd(controller.totalAmount)}đ'),
                        headerContainer('Số GD thanh toán',
                            controller.histories.value.length.toString()),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                      color: Colors.grey.withOpacity(0.1),
                      child: Obx(() => ListView.builder(
                          itemCount: controller.histories.value.length,
                          itemBuilder: (item, index) {
                            return card(
                                DateTimeUtils.stringToDateTimeVer2(
                                    controller.histories.value[index].createdAt!),
                                controller.histories.value[index].totalAmount!,
                                true);
                          }))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container card(String dateTime, double number, bool isSuccess) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      height: 60.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
            )
          ]),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.wallet_rounded,
                  size: 25.sp,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Khách hàng thanh toán',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeights.medium),
                    ),
                    Text(
                      dateTime,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeights.medium),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${isSuccess ? '-' : '+'}${NumberUtils.vnd(number)}đ',
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeights.medium),
                ),
                Text(
                  textAlign: TextAlign.end,
                  isSuccess ? 'Thành công' : 'Thất bại',
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeights.medium),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container headerContainer(String text, String number) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: 160.w,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.blue[600],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white.withOpacity(.8),
                fontSize: 12.sp,
                fontWeight: FontWeights.medium),
          ),
          Text(
            number,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeights.medium),
          )
        ],
      ),
    );
  }
}
