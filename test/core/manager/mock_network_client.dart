import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_tech_task/core/constants/network/http_call_type/http_call_type.dart';

import '../../common/base/mock_base_result.dart';
import '../../common/base/mock_exception.dart';
import '../model/mock_cancel_token.dart';

class MockNetworkClient {
  final Dio _dio;

  MockNetworkClient({required Dio dio}) : _dio = dio;

  // Call:----------------------------------------------------------------------

  Future<MockResult<T, MockAppException>> call<T>({
    required String path,
    required HttpCallType callType,
    required T Function(dynamic json) mapper,
    bool? withOutMapper = false,
    dynamic data,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    String? savePath,
  }) async {
    try {
      // bool hasConnection = await connectionCheckHelper.checkConnectivity();
      // if (hasConnection == true) {
      //   mapper = (json) {
      //     return false as T;
      //   };
      //   throw DioException(
      //       requestOptions: RequestOptions(),
      //       response: Response(requestOptions: RequestOptions(), data: {
      //         'error': 'İnternet Bağlantınız bulunmamaktadır.',
      //         'success': false
      //       }));
      // }

      late Response<dynamic> dioResponse;
      cancelToken = MockAppCancelToken.cancelToken;
      Map<String, String> headers = await _generateHeaders();
      options ??= Options();
      options = options.copyWith(headers: headers);
      if (callType == HttpCallType.GET)
        dioResponse = await _get(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );

      if (callType == HttpCallType.POST)
        dioResponse = await _post(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );

      if (callType == HttpCallType.PUT)
        dioResponse = await _put(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
          data: data,
        );

      if (callType == HttpCallType.DELETE)
        dioResponse = await _delete(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );
      if (callType == HttpCallType.PATCH)
        dioResponse = await _patch(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );
      if (callType == HttpCallType.DOWNLOAD)
        dioResponse = await _download(
          path,
          savePath,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data,
        );

      // final fromResponse = MockResult.fromResponse(dioResponse, mapper);
      // return fromResponse;
      return _handleResponse(dioResponse, mapper, withOutMapper!);
    } on DioException catch (exception) {
      return _handleErrors(exception, mapper);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    return response;
  }

  // Post:----------------------------------------------------------------------
  Future<Response<T>> _post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Put:-----------------------------------------------------------------------
  Future<Response<T>> _put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Delete:--------------------------------------------------------------------
  Future<Response<T>> _delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }

  // Patch:---------------------------------------------------------------------
  Future<Response<T>> _patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final response = await _dio.patch<T>(
      path,
      queryParameters: queryParameters,
      data: data,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  // Download:------------------------------------------------------------------
  Future<Response<dynamic>> _download<T>(
    String urlPath,
    dynamic savePath, {
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    bool deleteOnError = true,
    String lengthHeader = Headers.contentLengthHeader,
    dynamic data,
    Options? options,
  }) async {
    final response = await _dio.download(
      urlPath,
      savePath,
      // onReceiveProgress: onReceiveProgress,
      // queryParameters: queryParameters,
      // cancelToken: cancelToken,
      // deleteOnError: deleteOnError,
      // lengthHeader: lengthHeader,
      // data: data,
      // options: options,
    );

    return response;
  }

  Future<Map<String, String>> _generateHeaders() async {
    Map<String, String> headers = {};

    /// Token için interceptor'ımız var request ile birlikte print edilmesi için buraya da ekledik.
    /// İkisi de kullanılabilir.

    // final IAuthLocalService _authLocalService =
    //     ServiceLocatorProvider.provide<IAuthLocalService>();

    // LoginResponseEntity? _loginReponseEntity =
    //     await _authLocalService.get(CacheConstants.AccessToken.name);

    // String token = _loginReponseEntity?.token ?? '';

    // if (token.isNotEmpty) {
    //   headers.addAll({"Authorization": "Bearer $token"});
    // }

    return headers;
  }

  Future<MockResult<T, MockAppException>> _handleResponse<T>(
    Response? dioResponse,
    T Function(dynamic) mapper,
    bool withOutMapper,
  ) async {
    late MockResult<T, MockAppException> response;

    if (withOutMapper) {
      switch (dioResponse?.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.accepted:
        case HttpStatus.noContent:
          response = MockSuccess(dioResponse!.data as T);
      }
    } else {
      response = MockResult.fromResponse(dioResponse, mapper);
    }

    return response;
  }

  Future<MockResult<T, MockAppException>> _handleErrors<T>(
    DioException exception,
    T Function(dynamic) mapper,
  ) async {
    switch (exception.response?.statusCode) {
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:

      /// Authorization hatasının handle edilip refreshToken veya logout işlemi

      // final authCubit = ServiceLocatorProvider.provide<AuthCubit>();
      // AppLogger.call(
      //     title: 'Dio Exception',
      //     value: exception.requestOptions.uri.toString());
      // if (exception.requestOptions.uri
      //     .toString()
      //     .contains(HttpClientEndPoints.RefreshToken.URL)) {
      //   await authCubit.logout();
      // } else {
      //   await authCubit.refreshToken();
      // }

      // throw exception;

      default:
    }

    return MockResult.fromResponse(exception.response, mapper);
  }
}
