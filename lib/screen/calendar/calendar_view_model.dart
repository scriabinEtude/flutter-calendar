import 'dart:async';

import 'package:calendar/repository/event_repository.dart';
import 'package:calendar/repository/impl/event_repository_impl.dart';
import 'package:calendar/screen/calendar/calendar_event.dart';
import 'package:calendar/screen/calendar/calendar_state.dart';
import 'package:calendar/screen/calendar/calendar_ui_event.dart';
import 'package:flutter/material.dart';


class CalendarViewModel extends ChangeNotifier{

  CalendarState _state = const CalendarState(
    events: []
  );

  CalendarState get state => _state;

  final EventRepository _eventRepository = EventRepositoryImpl();

  final _calendarController = StreamController<CalendarUiEvent>();
  Stream<CalendarUiEvent> get calendarStream => _calendarController.stream;

  call(CalendarEvent event) {
    event.when(
      selectAllEvents: _selectAllEvent
    );
  }

  _selectAllEvent() async {
    final events = await _eventRepository.selectAll();
    events.when(
      success: (events) {
        _state = _state.copyWith(events: events);
        _calendarController.add(const CalendarUiEvent.refresh());
      } ,
      error: (message) => _calendarController.add(const CalendarUiEvent.loadFailed('이벤트 로드에 실패하였습니다.'))
    );
  }

}