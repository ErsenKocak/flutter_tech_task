import 'package:flutter_tech_task/common/base/result/custom_messages/custom_messages.dart';

class AppException implements Exception {
  final String message;
  final CustomMessages? customMessages;

  AppException(this.message, {this.customMessages});
}
