import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class LoginController extends GetxController {
  void init() {}

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void signIn() {
    Get.toNamed(Routes.SIGNIN);
  }

  void signUp() {
    Get.toNamed(Routes.SIGNUP);
  }
}
