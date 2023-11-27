import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class LoginController extends GetxController {
  void init() {}

  void signIn() {
    Get.toNamed(Routes.SIGNIN);
  }

  void signUp() {
    Get.toNamed(Routes.SIGNUP);
  }
}
