import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class NewPassWordController extends GetxController{
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void resetPassword(){
    Get.toNamed(Routes.MAIN);
  }

}