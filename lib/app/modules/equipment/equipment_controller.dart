import 'dart:convert';

import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/models/category_model.dart';
import 'package:rent_camera/app/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EquipmentController extends GetxController {
  late Rx<List<CategoryModel>> categories = Rx([]);

  late Rx<Map<CategoryModel, List<ProductModel>>> mapData = Rx({});

  void init() {
    fetchListCategory();
  }

  Future<void> fetchListCategory() async {
    mapData = Rx({});
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Categories"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      for (var p in result) {
        CategoryModel category = CategoryModel.fromJson(p);
        mapData.value[category] = await getProductsByCategory(category.id!);
      }
    } else {}
    update();
  }

  Future<List<ProductModel>> getProductsByCategory(int id) async {
    late List<ProductModel> products = [];
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Products?categoryId=$id"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> data = result['contends'];
      for (var p in data) {
        ProductModel product = ProductModel.fromJson(p);
        products.add(product);
      }
    } else {}
    update();
    return products;
  }
}
