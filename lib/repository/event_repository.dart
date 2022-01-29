import 'package:calendar/model/event.dart';
import 'package:calendar/model/result.dart';

abstract class EventRepository {
  Future<Result<List<Event>>> selectAll();
  Future<Result<Event>> select(Event event);
  Future<Result<void>> insert(Event event);
  Future<Result<void>> delete(Event event);
  Future<Result<void>> update(Event event);
}