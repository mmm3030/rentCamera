import 'package:get/get.dart';
import 'package:rent_camera/app/modules/address/address_controller.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}
