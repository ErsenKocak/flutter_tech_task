import 'dart:async';

import 'package:dio/dio.dart';

class DioTokenInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final IAuthLocalService _authLocalService =
    //     ServiceLocatorProvider.provide<IAuthLocalService>();

    // LoginResponseEntity? _loginReponseEntity =
    //     await _authLocalService.get(CacheConstants.AccessToken.name);

    // String token = _loginReponseEntity?.token ?? '';

    // if (token.isNotEmpty) {
    //   options.headers.addAll({"Authorization": "Bearer $token"});
    // }

    // return handler.next(options);
  }
}
