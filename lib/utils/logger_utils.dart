import 'package:logger/logger.dart';

class Log {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    
    ),
  );

  static void d(dynamic message, {String title = "Debug Title"}) {
    _logger.d('---- [$title] ---- \n $message');
  }

  static void i(dynamic message, {String title = "Info Title"}) {
    _logger.i('---- [$title] ---- \n $message');
  }

  static void w(dynamic message, {String title = "Warning Title"}) {
    _logger.w('---- [$title] ---- \n $message');
  }

  static void e(dynamic message, {String title = "Error Title"}) {
    _logger.e('---- [$title] ---- \n $message');
  }
}
