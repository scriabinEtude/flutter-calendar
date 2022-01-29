import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'add_event_state.freezed.dart';

enum ActivateDatePickerType{
  start, end
}

@freezed
class AddEventState with _$AddEventState {

  const factory AddEventState({
    int? seq,
    required DateTime date,
    String? title,
    required ActivateDatePickerType activateDatePickerType,
    DateTime? start,
    DateTime? end,
    required bool isAllDay,
    List<XFile>? images,
    String? description,
    required Color color,

    /// controllers
    required TextEditingController titleController,
    required TextEditingController descriptionController,
  }) = _AddEventState;

}
