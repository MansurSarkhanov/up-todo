import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 1, colors: true, printEmojis: true),
  );

  static void i(String message) => _logger.i(message);
  static void w(String message) => _logger.w(message);
  static void e(
    String message, [
    dynamic error,
    DateTime? time,
    StackTrace? stackTrace,
  ]) => _logger.e(message, time: time, error: error, stackTrace: stackTrace);
}
