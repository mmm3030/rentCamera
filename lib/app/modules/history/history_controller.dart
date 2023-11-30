import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rent_camera/app/core/utils/constants.dart';
import 'package:rent_camera/app/core/utils/index.dart';
import 'package:rent_camera/app/models/history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController extends GetxController with StateMixin {
  getData() async {
    change(null, status: RxStatus.loading());
    await fetchHistory();
    change(null, status: RxStatus.success());
  }

  late Rx<List<HistoryModel>> histories = Rx([]);

  @override
  void onInit() async {
    bool isAuth = await Utils.checkTokenValid();
    if (isAuth) {
      getData();
    }
    super.onInit();
  }

  get totalAmount => histories.value
      .map((e) => e.totalAmount)
      .reduce((value, element) => value! + element!);

  Future<void> fetchHistory() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/Users/Bookings"),
      headers: Constants.header(token!),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
      List<dynamic> data = result['contends'];
      List<HistoryModel> historyList = [];
      for (var p in data) {
        HistoryModel historyModel = HistoryModel.fromJson(p);
        historyList.add(historyModel);
      }
      histories(historyList);
    } else if (response.statusCode == 401) {
      Utils.handleError401();
    }
    update();
  }
}
