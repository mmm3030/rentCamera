import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  Future<bool> hasToken() async {
    var prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null) {
      return false;
    }
    return false;
  }
}
