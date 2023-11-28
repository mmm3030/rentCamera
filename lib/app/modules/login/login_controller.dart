import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  void init() {}

  @override
  Future<void> onInit() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      Get.toNamed(Routes.MAIN);
    }
    super.onInit();
  }

  void signIn() {
    Get.toNamed(Routes.SIGNIN);
  }

  void signUp() {
    Get.toNamed(Routes.SIGNUP);
  }
}
