import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/date_time_utils.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/modules/main/main_controller.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var switchButton = true.obs;

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      usernameController.text = Get.arguments['username'];
    }
    super.onInit();
  }

  void forgotPassword() {
    Get.toNamed(Routes.FORGOT);
  }

  Future<void> login() async {
    EasyLoading.show(status: 'loading...');
    var prefs = await SharedPreferences.getInstance();
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Auth/SignIn"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "username": usernameController.text,
              "password": passwordController.text,
            }));
    if (response.statusCode == 200) {
      prefs.setString('token', jsonDecode(response.body)['accessToken']);
      prefs.setString(
          'refreshToken', jsonDecode(response.body)['refreshToken']);
      MainController().onInit();
      Get.toNamed(Routes.MAIN);
      EasyLoading.dismiss();

      update();
    } else if (response.statusCode == 401) {
      Utils.handleError401();
    }
  }

  Future<void> checkTokenValid() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return;
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    DateTime? exp = DateTimeUtils.parseDateTime(payload['exp']);
    if (exp != null && exp.compareTo(DateTime.now()) > 0) {
    } else {
      return;
    }
  }
}
