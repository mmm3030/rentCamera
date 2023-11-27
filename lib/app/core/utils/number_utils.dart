import 'package:intl/intl.dart';

abstract class NumberUtils {
  static NumberFormat numberFormat = NumberFormat();

  static String vnd(double? value) {
    if (value == null) return '-';
    return "${numberFormat.format(value)}";
  }
}
