import 'package:dio/dio.dart';

class MockAppCancelToken {
  static late CancelToken cancelToken;

  static void initialize() {
    cancelToken = CancelToken();
  }
}
