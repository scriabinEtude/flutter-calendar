import 'package:calendar/model/event.dart';
import 'package:calendar/screen/add_event/add_event_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'add_event_event.freezed.dart';

@freezed
class AddEventEvent with _$AddEventEvent {
  const factory AddEventEvent.selectDatePickerType(ActivateDatePickerType type) = SelectDatePickerType;
  const factory AddEventEvent.updatePickedDate(ActivateDatePickerType type, DateTime pickedDate) = UpdatePickedDate;
  const factory AddEventEvent.toggleAllDay() = ToggleAllDay;
  const factory AddEventEvent.addImages(List<XFile> images) = AddImages;
  const factory AddEventEvent.deleteImage(XFile image) = DeleteImage;
  const factory AddEventEvent.updateDescription(String description) = UpdateDescription;
  const factory AddEventEvent.updateColor(Color color) = UpdateColor;
  const factory AddEventEvent.updateTitle(String title) = UpdateTitle;
  const factory AddEventEvent.insertOrUpdateEvent() = InsertOrUpdateEvent;
  const factory AddEventEvent.setDate(DateTime date) = SetDate;
  const factory AddEventEvent.loadEvent(Event event) = LoadEvent;
  const factory AddEventEvent.deleteEvent() = DeleteEvent;
}
