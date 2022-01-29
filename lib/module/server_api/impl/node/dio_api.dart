import 'package:calendar/model/result.dart';
import 'package:calendar/module/server_api/impl/node/logging_interceptor.dart';
import 'package:calendar/module/server_api/server_api.dart';
import 'package:dio/dio.dart';

class DioApi implements ServerApi {
  static const String _baseUrl = 'http://10.0.2.2:3010/v1';
  static final _api = Dio()
    ..interceptors.add(LoggingInterceptor())
  ;

  Future<Response> _post(String endPoint, {Map<String, dynamic>? data}) async {
      return await _api.post(_baseUrl + endPoint, data: data);
  }

  @override
  Future<Result<List<T>>> select<T>(
    String endPoint,
    T Function(dynamic) converterFn,
    {Map<String, dynamic>? data}
  ) async {
    try {
      final Response response = await _post(endPoint, data: data);
      final List<dynamic> result =  response.data;

      if(response.statusCode == 200){
        return Result.success(result.map<T>(converterFn).toList());
      }
      else {
        throw Result.error('[${response.statusCode}] : ${response.statusMessage}');
      }
    } catch(e) {
      print(e);
      throw const Result.error('api error');
    }
  }

  @override
  Future<Result<T>> call<T>(
      String endPoint,
      {
        Map<String, dynamic>? data
      }) async {

    try{
      final Response response = await _post(endPoint, data: data);

      if(response.statusCode == 200){
        final T data = response.data;
        return Result.success(data);
      }else{
        throw Result.error('[${response.statusCode}] : ${response.statusMessage}');
      }
    }catch(e){
      print(e);
      throw const Result.error('api error');
    }
  }
}