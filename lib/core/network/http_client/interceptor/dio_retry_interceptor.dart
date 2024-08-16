import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_tech_task/core/network/http_client/http_client_api_url/http_client_end_points.dart';

class DioRetryInterceptor {
  static RetryInterceptor getInterceptor({required Dio dio}) {
    return RetryInterceptor(
      retries: 0,
      retryDelays: [Duration(seconds: 3)],
      dio: dio,
      retryEvaluator: (error, attempt) {
        if (error.requestOptions.uri
            .toString()
            .contains(HttpClientEndPoints.RefreshToken.URL)) {
          return false;
        }
        return true;
      },
    );
  }
}
