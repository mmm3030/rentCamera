import 'package:get/get.dart';
import 'package:rent_camera/app/modules/forgotPassword/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}