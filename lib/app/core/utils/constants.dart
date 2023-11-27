abstract class Constants {
  static String baseUrl = 'https://dijohob882-001-site1.atempurl.com/api';

  static Map<String, String> header(String token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
