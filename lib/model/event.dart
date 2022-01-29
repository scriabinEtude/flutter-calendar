import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  int? seq;
  String date;
  String title;
  @JsonKey(fromJson: _boolFromInt)
  bool is_all_day;
  String? start;
  String? end;
  int color;
  String? description;

  Event({
    this.seq,
    required this.date,
    required this.title,
    required this.is_all_day,
    this.start,
    this.end,
    this.color = 4278190080,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);

  static bool _boolFromInt(int tinyInt) => tinyInt == 1;
}