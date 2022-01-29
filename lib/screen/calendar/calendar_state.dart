import 'package:freezed_annotation/freezed_annotation.dart';

import '../../model/event.dart';

part 'calendar_state.freezed.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    required List<Event> events,
  }) = _AddEventState;
}
