import 'package:get/get.dart';
import 'package:rent_camera/app/modules/history/history_controller.dart';

class HistoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
    
  }

}