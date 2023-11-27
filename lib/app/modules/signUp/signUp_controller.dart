import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class SignUpController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var switchButton = true.obs;

  void createAccount() {
    // Get.toNamed(Routes.MAIN);
    fetchRegister();
  }

  Future<void> fetchRegister() async {
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Auth/Register"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "username": usernameController.text,
              "password": passwordController.text,
              "email": emailController.text,
            }));
    if (response.statusCode == 201) {
      Get.toNamed(Routes.SIGNIN,
          arguments: {'username': usernameController.text});
      toast('Notification', 'Check your email to confirm account!');
      update();
    } else if (response.statusCode == 401) {
      Utils.handleError401();
    }
  }

  void toast(String title, String messageText) {
    Get.snackbar(
      "",
      "",
      titleText: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.sp),
        ),
      ),
      messageText: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: Text(
          messageText,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 13.sp),
        ),
      ),
      backgroundColor: AppColors.bottomButtonColor,
      duration: const Duration(seconds: 10),
    );
  }
}
