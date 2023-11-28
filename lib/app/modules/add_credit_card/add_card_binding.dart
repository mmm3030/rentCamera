import 'package:get/get.dart';
import 'package:rent_camera/app/modules/add_credit_card/add_card_controller.dart';

class AddCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCardController>(() => AddCardController());
  }
}