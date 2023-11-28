import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:rent_camera/app/core/utils/date_time_utils.dart';
import 'package:rent_camera/app/core/values/app_colors.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Utils {
  static truncateString(String str, int num) {
    if (str.isEmpty) {
      return str;
    }
    if (str.length > num) {
      return "${str.substring(0, num)}...";
    }
    return str;
  }

  static Future<void> handleError401() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAllNamed(Routes.LOGIN);
  }

  static void toast(String title, String messageText) {
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

  static Future<bool> checkTokenValid() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token == null) return false;
    Map<String, dynamic> payload = Jwt.parseJwt(token.toString());
    DateTime? exp = DateTimeUtils.parseDateTime(payload['exp']);
    if (exp != null && exp.compareTo(DateTime.now()) > 0) {
      return true;
    } else {
      return false;
    }
  }

  static String creditCard(String cardNumber) {
    if (cardNumber.isNotEmpty) {
      return cardNumber.substring(cardNumber.length - 4, cardNumber.length);
    }
    return "";
  }

  static String hiddenNumberCard(String cardNumber) {
    if (cardNumber.isNotEmpty) {
      return "**** **** **** " +
          cardNumber.substring(cardNumber.length - 4, cardNumber.length);
    }
    return "";
  }
}
