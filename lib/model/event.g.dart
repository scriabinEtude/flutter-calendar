// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      seq: json['seq'] as int?,
      date: json['date'] as String,
      title: json['title'] as String,
      is_all_day: Event._boolFromInt(json['is_all_day'] as int),
      start: json['start'] as String?,
      end: json['end'] as String?,
      color: json['color'] as int? ?? 4278190080,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'seq': instance.seq,
      'date': instance.date,
      'title': instance.title,
      'is_all_day': instance.is_all_day,
      'start': instance.start,
      'end': instance.end,
      'color': instance.color,
      'description': instance.description,
    };
