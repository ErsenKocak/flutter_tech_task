import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tech_task/common/base/result/custom_messages/custom_messages.dart';
import 'package:flutter_tech_task/common/base/result/exception.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';
import 'package:flutter_tech_task/generated/locale_keys.g.dart';

sealed class Result<S, E extends AppException?> {
  const Result();

  /// Backend ile ortak response yapısı için kullanılan propertyler
  static const String _jsonNodeError = "error";
  static const String _jsonNodeErrors = "errors";
  static const String _isSuccess = "success";
  static const String _result = "result";
  static const String _data = "data";
  static const String _message = "message";
  static const String _customMessages = "customMessages";

  static Result<T, AppException> fromResponse<T>(
    Response? response,
    T Function(dynamic) mapper,
  ) {
    final responseData = response?.data[_data];

    if (responseData != null && responseData != '') {
      return _returnSuccess<T>(mapper(responseData));
    } else {
      return _returnFailure<T>(
          responseData, LocaleKeys.ErrorMessages_GlobalError.tr());
    }

    /// Backend yapısı dahil olduğunda

    // if (responseData != null && responseData != '') {
    //   if (_checkHasError(responseData)) {
    // return _returnSuccess<T>(mapper(responseData));
    //   }
    //   return _returnSuccess(mapper(responseData[_result]))
    //       as Result<T, AppException>;
    // } else {
    // return _returnFailure<T>(
    //     responseData, LocaleKeys.ErrorMessages_GlobalError.tr());
    // }
  }

  static bool _checkHasError(dynamic response) {
    return response is Map &&
        (response[_jsonNodeErrors] != null ||
            response[_jsonNodeError] != null ||
            response[_isSuccess] != true);
  }

  static Success<T, AppException> _returnSuccess<T>(dynamic response) {
    return Success(response);
  }

  static Failure<T, AppException> _returnFailure<T>(
      dynamic response, String errorMessage) {
    return Failure(
      AppException(
        _getErrorMessage(errorMessage),
        customMessages: _getCustomMessages(response[_customMessages] != null
            ? response[_customMessages]
            : null),
      ),
    );
  }

  static String _getErrorMessage(String? message) {
    if (message != null && message != '') {
      return message;
    } else {
      return LocaleKeys.ErrorMessages_GlobalError.tr();
    }
  }

  static CustomMessages? _getCustomMessages(
      Map<String, dynamic>? customMessages) {
    if (customMessages.isNullOrEmpty) return null;

    return CustomMessages.fromJson(customMessages!);
  }
}

final class Success<S, E extends AppException> extends Result<S, E> {
  const Success(this.value);
  final S value;
}

final class Failure<S, E extends AppException> extends Result<S, E> {
  const Failure(this.exception);
  final E exception;
}
