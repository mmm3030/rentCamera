import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class ForgotPasswordOptController extends GetxController {
  TextEditingController pin1 = TextEditingController();
  TextEditingController pin2 = TextEditingController();
  TextEditingController pin3 = TextEditingController();
  TextEditingController pin4 = TextEditingController();
  TextEditingController pin5 = TextEditingController();
  TextEditingController pin6 = TextEditingController();
  late String code = '';
  late String email = '';
  late Timer timer;
  var start = 59.obs;

  get timing => start.value.toInt();

  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (start == 0) {
  //         timer.cancel();
  //       } else {

  //         start--;
  //       }
  //     },
  //   );
  // }

  @override
  void onClose() {
    // timer.cancel();
    super.onClose();
  }

  void confirmCode() {
    String code = Get.arguments['code'];
    String opt =
        pin1.text + pin2.text + pin3.text + pin4.text + pin5.text + pin6.text;
    if (code == opt) {
      Get.toNamed(Routes.NEWPASSWORD,
          arguments: {'email': Get.arguments['email'], 'code': code});
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      code = Get.arguments['code'];
      email = Get.arguments['email'];
    }
    super.onInit();
  }
}
