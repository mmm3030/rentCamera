import 'package:get/get.dart';
import 'package:rent_camera/app/modules/signIn/signIn_controller.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
