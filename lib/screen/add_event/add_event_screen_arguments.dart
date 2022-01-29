import 'package:calendar/model/event.dart';
import 'package:flutter/material.dart';

class AddEventScreenArguments {
  DateTime selectedDay;
  Event? event;

  AddEventScreenArguments({
    required this.selectedDay,
    this.event,
  });
}
