import 'package:get/get.dart';

import 'package:rent_camera/app/modules/equipment/equipment_controller.dart';

class EquipmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EquipmentController>(() => EquipmentController());
  }
}
