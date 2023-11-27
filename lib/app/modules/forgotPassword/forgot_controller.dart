import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/modules/forgotPassword_opt/forgotPassOpt_controller.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();

  void confirmEmail() {
    fetchForgotPassword();
    // ForgotPasswordOptController().startTimer();
  }

  Future<void> fetchForgotPassword() async {
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Auth/ForgotPassword"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "email": email.text,
            }));
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      Utils.toast('Notification', 'Check your email to get Opt code!');
      Get.toNamed(Routes.FORGOTOPT,
          arguments: {'email': email.text, 'code': result['code']});
    } else {
      Utils.toast(
          'Notification', 'Email not found or your email does not confirmed!');
    }
    update();
  }
}
