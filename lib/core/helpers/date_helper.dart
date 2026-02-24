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
    // Firestore Timestamp -> DateTime
    DateTime date;
    if (timestamp is DateTime) {
      date = timestamp;
    } else if (timestamp != null && timestamp.toDate != null) {
      date = timestamp.toDate();
    } else {
      throw Exception("Invalid timestamp format");
    }

    return formatToDayMonthYear(date);
  }

  /// Custom format
  String formatCustom(DateTime date, String pattern) {
    return DateFormat(pattern).format(date);
  }
}
