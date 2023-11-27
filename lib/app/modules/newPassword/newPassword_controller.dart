import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NewPassWordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void resetPassword() {
    if (passwordController.text == confirmPasswordController.text) {
      fetchResetPassword();
    } else {
      Utils.toast('Notification', 'Password not matched!');
    }
    // Get.toNamed(Routes.MAIN);
  }

  Future<void> fetchResetPassword() async {
    var prefs = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Auth/ResetPassword"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "email": Get.arguments['email'],
              "newPassword": passwordController.text,
              "resetCode": Get.arguments['code'],
            }));
    if (response.statusCode == 200) {
      Utils.toast('Notification', 'Your password has been reset!');
      Get.toNamed(Routes.SIGNIN);
      // Get.toNamed(Routes.MAIN);
      update();
    }
  }
}
