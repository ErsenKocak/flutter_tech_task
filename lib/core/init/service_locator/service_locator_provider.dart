import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/logger/app_logger.dart';
import 'package:logger/logger.dart';
import 'package:flutter_tech_task/core/init/service_locator/service_locator.dart'
    as dependencyInjection;

class ServiceLocatorProvider {
  static T provide<T extends Object>() {
    try {
      return dependencyInjection.provide<T>();
    } catch (e) {
      AppLogger.call(
        logLevel: Level.error,
        title: 'Service Locator Provider',
        value: 'No locator to access found!!!',
      );

      FlutterError.reportError(
        FlutterErrorDetails(
          exception: Exception(
            'No locator to access found!!! ${T.toString()}',
          ),
          stack: StackTrace.current,
        ),
      );

      rethrow;
    }
  }
}
