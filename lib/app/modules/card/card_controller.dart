import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/models/card_model.dart';
import 'package:rent_camera/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardController extends GetxController {
  late Rx<List<CardModel>> listCard = Rx([]);
  var cardSelected = 0.obs;

  @override
  void onInit() {
    EasyLoading.show(status: 'loading...');
    fetchCreditCard();
    super.onInit();
  }

  void addCard() {
    Get.toNamed(Routes.ADDCARD);
  }

  get cardModel =>
      listCard.value.where((element) => element.id == cardSelected.value).first;

  CardModel getCardCredit() {
    return listCard.value
        .firstWhere((element) => element.id == cardSelected.value);
  }

  void saveCard() {
    Get.back();
  }

  Future<void> fetchCreditCard() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/CreditCards"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<CardModel> listCardTmp = [];
      for (var p in result) {
        CardModel card = CardModel.fromJson(p);

        listCardTmp.add(card);
      }
      listCard(listCardTmp);
      cardSelected.value = listCard.value.first.id!;
      EasyLoading.dismiss();
      update();
    } else if (response.statusCode == 400) {}
  }
}
