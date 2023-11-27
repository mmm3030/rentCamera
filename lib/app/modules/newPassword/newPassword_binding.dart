import 'package:get/get.dart';
import 'package:rent_camera/app/modules/newPassword/newPassword_controller.dart';

class NewPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPassWordController>(() => NewPassWordController());
  }
}
