import 'package:get/get.dart';
import 'package:rent_camera/app/modules/contact/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
