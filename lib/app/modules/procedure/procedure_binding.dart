import 'package:get/get.dart';
import 'package:rent_camera/app/modules/procedure/procedure_controller.dart';

class ProcedureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProcedureController>(() => ProcedureController());
  }
}
