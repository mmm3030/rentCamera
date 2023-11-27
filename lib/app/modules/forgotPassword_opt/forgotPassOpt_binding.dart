import 'package:get/get.dart';
import 'package:rent_camera/app/modules/forgotPassword_opt/forgotPassOpt_controller.dart';

class ForgotOptBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordOptController>(() => ForgotPasswordOptController());
  }
}
