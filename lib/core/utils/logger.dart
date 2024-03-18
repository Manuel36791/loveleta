import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0, // Number of method calls to be displayed
      errorMethodCount: 8, // Number of method calls if stacktrace is provided
      lineLength: 60, // Width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: true // Should each log print contain a timestamp
      ),
  filter: null,
  level: Level.debug,
  output: null,
);

// class SimpleLogPrinter extends LogPrinter {
//   final String className;
//   final PrettyPrinter _printer;
//
//   SimpleLogPrinter(this.className) : _printer = PrettyPrinter();
//
//   @override
//   List<String> log(LogEvent event) {
//     var color = _printer.levelColors![event.level];
//     var emoji = _printer.levelEmojis![event.level];
//     var time = DateTime.now().toIso8601String().split('T')[1];
//     var header = '$time $emoji $className -';
//
//     print(color!('$header ${event.message}'));
//     if (event.error != null) {
//       print(color(event.error.toString()));
//     }
//     if (event.stackTrace != null) {
//       print(color(event.stackTrace.toString()));
//     }
//
//     // Return an empty list since the return type is List<String>
//     return [];
//   }
// }