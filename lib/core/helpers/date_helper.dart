import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateHelper {
  // Singleton pattern, istəyə görə
  DateHelper._privateConstructor();
  static final DateHelper instance = DateHelper._privateConstructor();

  /// Format DateTime to "12 Feb 2026"
  String formatToDayMonthYear(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  /// Format Firestore Timestamp to "12 Feb 2026"
  String formatTimestamp(dynamic timestamp) {
    if (timestamp is DateTime) {
      return formatToDayMonthYear(timestamp);
    } else if (timestamp != null) {
      final date = (timestamp as Timestamp).toDate();
      return formatToDayMonthYear(date);
    } else {
      throw Exception('Invalid timestamp format');
    }
  }

  /// Custom format
  String formatCustom(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }
}
