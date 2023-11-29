import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/controller/cart_controller.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/models/address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddressController extends GetxController {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController countryController = TextEditingController();
  late TextEditingController cityController = TextEditingController();
  late TextEditingController phoneNumber = TextEditingController();
  late TextEditingController addressController = TextEditingController();

  var setPrimaryAddress = true.obs;

  late Rx<List<AddressModel>> listAddress = Rx([]);
  late Rx<AddressModel> primaryAddress = Rx(AddressModel());

  @override
  onInit() async {
     bool isAuth = await Utils.checkTokenValid();
    if (isAuth) {
       fetchAddress();
    }

    super.onInit();
  }

  Future<void> fetchAddress() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/Addresses/"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<AddressModel> listAddressTmp = [];
      for (var p in result) {
        AddressModel address = AddressModel.fromJson(p);
        listAddressTmp.add(address);
        if (address.isPrimary!) {
          primaryAddress(address);
        }
      }
      listAddress(listAddressTmp);
    } else if (response.statusCode == 400) {}
    update();
  }

  Future<void> fetchAddAddress() async {
    if (nameController.text.isEmpty ||
        phoneNumber.text.isEmpty ||
        countryController.text.isEmpty ||
        cityController.text.isEmpty ||
        addressController.text.isEmpty) {
      return Utils.toast('Notification', 'Please fill all fields!');
    }

    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Users/Addresses"),
            headers: Constants.header(token!),
            body: jsonEncode({
              "fullName": nameController.text,
              "phoneNumber": phoneNumber.text,
              "country": countryController.text,
              "city": cityController.text,
              "street": addressController.text,
              "isPrimary": setPrimaryAddress.isTrue
            }));
    if (response.statusCode == 200) {
      fetchAddress();
      CartController().onInit();
      Get.back();
    } else if (response.statusCode == 400) {}
    update();
  }
}
