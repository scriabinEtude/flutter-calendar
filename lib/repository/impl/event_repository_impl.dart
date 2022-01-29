import 'package:calendar/model/event.dart';
import 'package:calendar/model/result.dart';
import 'package:calendar/module/server_api/impl/node/dio_api.dart';
import 'package:calendar/module/server_api/server_api.dart';
import 'package:calendar/repository/event_repository.dart';

class EventRepositoryImpl implements EventRepository{
  final ServerApi api = DioApi();

  @override
  Future<Result<List<Event>>> selectAll() async {
    return api.select<Event>('/event/selectAll', (json) => Event.fromJson(json));
  }

  @override
  Future<Result<Event>> select(Event event) {
    // TODO: implement select
    throw UnimplementedError();
  }

  @override
  Future<Result<void>> insert(Event event) async {
    return await api('/event/insert', data: event.toJson());
  }

  @override
  Future<Result<void>> delete(Event event) async {
    return await api('/event/delete', data: event.toJson());
  }

  @override
  Future<Result<void>> update(Event event) async {
    return await api('/event/update', data: event.toJson());
  }

}