import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}
