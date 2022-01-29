import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_event_ui_event.freezed.dart';

@freezed
class AddEventUiEvent with _$AddEventUiEvent {
  const factory AddEventUiEvent.notValid(String message) = NotValid;
  const factory AddEventUiEvent.eventSuccess() = EventSuccess;
  const factory AddEventUiEvent.eventFailed(String message) = EventFailed;
}
