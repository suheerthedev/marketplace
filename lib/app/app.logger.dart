import 'package:logger/logger.dart';

Logger getLogger(String name) {
  return Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      printEmojis: false,
      printTime: false,
      lineLength: 80,
    ),
  );
}
