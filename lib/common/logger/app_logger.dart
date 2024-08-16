import 'package:flutter_tech_task/common/logger/log_json.dart';
import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/enums/app_mode/app_mode.dart';
import 'package:logger/logger.dart';

final class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 400,
      colors: true,
      printEmojis: true,
      printTime: false,
    ),
  );

  static call({dynamic value, Level? logLevel, String? title}) {
    if (Application.appMode == AppMode.production) return;

    _logger.log(logLevel ?? Level.fatal, LogJson.format(value, title: title));
  }
}
