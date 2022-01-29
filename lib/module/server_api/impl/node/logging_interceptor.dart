import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    if (kDebugMode) {
      print('======================= request =====================');
      print('=== request === url : ' + options.baseUrl + options.path);
      print('=== request === data : ' + options.data.toString());
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {

    if (kDebugMode) {
      print('====================== response =====================');
      print("== response === " + response.toString());
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {

    if (kDebugMode) {
      print(err);
    }

    super.onError(err, handler);
  }
}