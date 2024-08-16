import 'package:flutter_tech_task/core/constants/application/application.dart';
import 'package:flutter_tech_task/core/enums/app_mode/app_mode.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioLoggerInterceptor {
  static PrettyDioLogger getInterceptor() {
    bool isLogActive = Application.appMode != AppMode.production;

    return PrettyDioLogger(
      requestHeader: isLogActive,
      request: isLogActive,
      requestBody: isLogActive,
      responseBody: isLogActive,
      error: isLogActive,
      responseHeader: false,
      compact: isLogActive,
      maxWidth: 1024,
    );
  }
}
