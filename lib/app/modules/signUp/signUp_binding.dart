import 'package:get/get.dart';
import 'package:rent_camera/app/modules/signUp/signUp_controller.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
