import 'package:get/get.dart';
import 'package:rent_camera/app/modules/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProductController>(() => SearchProductController());
  }
}
