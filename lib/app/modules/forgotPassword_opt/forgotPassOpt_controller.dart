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
  late Timer timer;
  var start = 59.obs;

  get timing => start.value.toInt();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          
          start--;
        }
      },
    );
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void confirmCode() {
    // timer.cancel();
    Get.toNamed(Routes.NEWPASSWORD);
  }
}
