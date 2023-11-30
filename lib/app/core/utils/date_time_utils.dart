import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String currentTimeAdd({int? second}) {
    initializeDateFormatting();
    var today = DateTime.now();
    var addSecond = today.add(Duration(seconds: second ?? 0));
    return DateFormat('HH:mm').format(addSecond);
  }

  static DateTime? stringToDateTimeFixUTC(String? value) {
    return DateTime.tryParse(value ?? '')?.add(const Duration(hours: 7));
  }

  static String dateTimeToString(DateTime? dateTime) {
    initializeDateFormatting();
    return dateTime == null ? '-' : DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static String stringToDateTime(String dateTime) {
    initializeDateFormatting();
    if (dateTime.isEmpty) {
      return "";
    }
    DateTime parseDate = DateFormat("dd/MM/yyyy").parse(dateTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static String stringToDateTimeVer2(String dateTime) {
    initializeDateFormatting();
    if (dateTime.isEmpty) {
      return "";
    }
    DateTime parseDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dateTime);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static DateTime? parseDateTime(int? timestamp) {
    return timestamp == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  }
}
