import 'package:logger/logger.dart';
import 'package:highfives_ui/logging/logPrinter.dart';

Logger getLogger(String className) {
  return Logger(printer: SimpleLogPrinter(className));
}