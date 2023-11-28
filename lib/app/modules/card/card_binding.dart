import 'package:get/get.dart';
import 'package:rent_camera/app/modules/card/card_controller.dart';

class CardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController());
  }
}
