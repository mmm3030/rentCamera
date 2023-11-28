import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/models/credit_card_model.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddCardController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  Rx<List<CreditCardModel>> listCreditCard = Rx([]);

  var intSelect = 0.obs;

  Future<void> fetchCreditCard() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/CreditCardTypes"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<CreditCardModel> listCardTmp = [];
      for (var p in result) {
        CreditCardModel card = CreditCardModel.fromJson(p);
        listCardTmp.add(card);
      }
      listCreditCard(listCardTmp);
    } else if (response.statusCode == 400) {}
    update();
  }

  void addCard() {
    if (nameController.text.isEmpty &&
        cardNumberController.text.isEmpty &&
        dateController.text.isEmpty &&
        cvvController.text.isEmpty) {
      return Utils.toast('Notification', 'Fill all fields');
    }
    fetchAddCreditCard();
  }

  Future<void> fetchAddCreditCard() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response =
        await http.post(Uri.parse("${Constants.baseUrl}/Users/CreditCards"),
            headers: Constants.header(token!),
            body: jsonEncode({
              "cardNumber": cardNumberController.text,
              "cardHolderName": nameController.text,
              "cvv": cvvController.text,
              "expiryMonth": int.parse(dateController.text.split("/")[0]),
              "expiryYear": int.parse(dateController.text.split("/")[1]),
              "isPrimary": true,
              "creditCardTypeId": intSelect.value.toInt() + 1,
            }));
    if (response.statusCode == 200) {
      Get.toNamed(Routes.CART);
    } else {
      var result = jsonDecode(utf8.decode(response.bodyBytes));
      Utils.toast('Notification', result['errors']['cardNumber'].first);
    }
    update();
  }

  @override
  void onInit() {
    fetchCreditCard();
    super.onInit();
  }
}
