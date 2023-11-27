import 'dart:convert';

import 'package:flutter/services.dart' as root_bundle;

class ReadJsonFile {
  static Future<Map> readJsonData({required String path}) async {
    final jsondata = await root_bundle.rootBundle.loadString(path);
    final list = json.decode(jsondata) as Map;
    return list;
  }
}
