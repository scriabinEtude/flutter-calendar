import 'package:calendar/model/result.dart';

abstract class ServerApi {
  Future<Result<T>> call<T>(String endPoint, {Map<String, dynamic>? data});
  Future<Result<List<T>>> select<T>(String endPoint, T Function(dynamic) converterFn, {Map<String, dynamic>? data});
}