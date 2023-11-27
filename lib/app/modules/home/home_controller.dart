import 'dart:convert';

import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/readJson.dart';
import 'package:rent_camera/app/models/product_model.dart';
import 'package:rent_camera/app/models/project_models.dart';
import 'package:rent_camera/app/models/service_models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late Rx<List<ServiceModels>> services = Rx([]);
  late Rx<List<ProjectModel>> projects = Rx([]);
  late Rx<List<ProductModel>> products = Rx([]);
  var dateStart = ''.obs;
  var dateEnd = ''.obs;
  late CartController cartController = Get.put(CartController());

  Future<void> readFileJson() async {
    var result =
        await ReadJsonFile.readJsonData(path: 'assets/models/data.json');
    List<dynamic> dataServices = result['services'];
    List<ServiceModels> serviceResult = [];

    for (var p in dataServices) {
      ServiceModels service = ServiceModels.fromJson(p);
      serviceResult.add(service);
    }

    List<dynamic> dataProjects = result['projects'];
    List<ProjectModel> projectResult = [];

    for (var p in dataProjects) {
      ProjectModel project = ProjectModel.fromJson(p);
      projectResult.add(project);
    }
    services(serviceResult);
    projects(projectResult);
  }

  Future<void> fetchListProduct() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Products?sort=averageRating%2Cdesc"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> data = result['contends'];
      List<ProductModel> productList = [];
      for (var p in data) {
        ProductModel product = ProductModel.fromJson(p);
        productList.add(product);
      }
      products(productList);
    } else {}
    update();
  }

  Future<void> init() async {
    fetchListProduct();
    await readFileJson();
  }
}
