import 'package:dio/dio.dart';
import 'package:flutter_tech_task/common/extensions/null_check/null_check_extension.dart';

import 'custom_messages/mock_custom_messages.dart';
import 'mock_exception.dart';

sealed class MockResult<S, E extends MockAppException?> {
  const MockResult();

  /// Backend ile ortak response yapısı için kullanılan propertyler
  static const String _jsonNodeError = "error";
  static const String _jsonNodeErrors = "errors";
  static const String _isSuccess = "success";
  static const String _result = "result";
  static const String _data = "data";
  static const String _message = "message";
  static const String _customMessages = "customMessages";

  static MockResult<T, MockAppException> fromResponse<T>(
    Response? response,
    T Function(dynamic) mapper,
  ) {
    final responseData = response?.data[_data];

    if (responseData != null && responseData != '') {
      return _returnSuccess<T>(mapper(responseData));
    } else {
      return _returnFailure<T>(responseData, 'Hata!');
    }

    /// Backend yapısı dahil olduğunda

    // if (responseData != null && responseData != '') {
    //   if (_checkHasError(responseData)) {
    // return _returnSuccess<T>(mapper(responseData));
    //   }
    //   return _returnSuccess(mapper(responseData[_result]))
    //       as Result<T, MockAppException>;
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

  static MockSuccess<T, MockAppException> _returnSuccess<T>(dynamic response) {
    return MockSuccess(response);
  }

  static MockFailure<T, MockAppException> _returnFailure<T>(
      dynamic response, String errorMessage) {
    return MockFailure(
      MockAppException(_getErrorMessage(errorMessage),
          customMessages: MockCustomMessages(navigationUrl: '')),
    );
  }

  static String _getErrorMessage(String? message) {
    if (message != null && message != '') {
      return message;
    } else {
      return 'Hata!';
    }
  }
}

final class MockSuccess<S, E extends MockAppException>
    extends MockResult<S, E> {
  const MockSuccess(this.value);
  final S value;
}

final class MockFailure<S, E extends MockAppException>
    extends MockResult<S, E> {
  const MockFailure(this.exception);
  final E exception;
}
