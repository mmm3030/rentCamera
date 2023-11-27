import 'package:get/get.dart';
import 'package:rent_camera/app/routes/app_pages.dart';

class CheckoutController extends GetxController {
  void continueRent() {
    Get.toNamed(Routes.MAIN);
  }

  void init() {}
}
