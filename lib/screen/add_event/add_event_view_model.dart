import 'dart:async';

import 'package:calendar/model/event.dart';
import 'package:calendar/model/result.dart';
import 'package:calendar/repository/event_repository.dart';
import 'package:calendar/repository/impl/event_repository_impl.dart';
import 'package:calendar/screen/add_event/add_event_event.dart';
import 'package:calendar/screen/add_event/add_event_state.dart';
import 'package:calendar/screen/add_event/add_event_ui_event.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class AddEventViewModel extends ChangeNotifier{
  final EventRepository eventRepository = EventRepositoryImpl();

  AddEventState _state = AddEventState(
    seq: null,
    date: DateTime.now(),
    title: "",
    activateDatePickerType: ActivateDatePickerType.start,
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(hours: 1)),
    isAllDay: false,
    images: [],
    description: '',
    color: Colors.amber[700]!,

    titleController: TextEditingController(),
    descriptionController: TextEditingController(),
  );

  AddEventState get state => _state;

  final _addEventController = StreamController<AddEventUiEvent>();
  Stream<AddEventUiEvent> get addEventStream => _addEventController.stream;

  Event _getEvent(){

    final Event event;

    if(_state.isAllDay){
      event = Event(
        seq: _state.seq,
        title: _state.title!,
        date: DateFormat('yyyyMMdd').format(_state.date),
        description: _state.description,
        color: _state.color.value,
        is_all_day: _state.isAllDay,
        start: null,
        end: null,
      );
    }else{
      event = Event(
          seq: _state.seq,
          title: _state.title!,
          date: DateFormat('yyyyMMdd').format(_state.date),
          description: _state.description,
          color: _state.color.value,
          is_all_day: _state.isAllDay,
          start: DateFormat('HHmm').format(_state.start!),
          end: DateFormat('HHmm').format(_state.end!)
      );
    }

    return event;
  }

  call(AddEventEvent event){
    event.when(
      setDate: (date) => _state = _state.copyWith(date: date),
      loadEvent: _loadEvent,
      selectDatePickerType: _selectDatePickerType,
      updatePickedDate: _updatePickedDate,
      toggleAllDay: _toggleAllDay,
      addImages: _addImages,
      deleteImage: _deleteImage,
      updateDescription: _updateDescription,
      updateColor: _updateColor,
      updateTitle: _updateTitle,
      insertOrUpdateEvent: _insertOrUpdateEvent,
      deleteEvent: _deleteEvent,
    );
  }

  _loadEvent(Event event){
    _state = AddEventState(
      seq: event.seq,
      date: DateTime.parse(event.date),
      title: event.title,
      activateDatePickerType: ActivateDatePickerType.start,
      start: event.start != null ? DateTime.parse('${event.date} ${event.start}00') : DateTime.now(),
      end: event.end != null ? DateTime.parse('${event.date} ${event.end}00') : DateTime.now(),
      isAllDay: event.is_all_day,
      images: [],
      description: event.description ?? "",
      color: Color(event.color),

      titleController: TextEditingController()..text = event.title,
      descriptionController: TextEditingController()..text = event.description ?? "",
    );

    notifyListeners();
  }

  _selectDatePickerType(ActivateDatePickerType type){
    _state = _state.copyWith(
      activateDatePickerType: type
    );
    notifyListeners();
  }

  _updatePickedDate(ActivateDatePickerType type, DateTime pickedDate){
    if(type == ActivateDatePickerType.start){
      _state = state.copyWith(start: pickedDate);
    }else{
      _state = state.copyWith(end: pickedDate);
    }
    notifyListeners();
  }

  _toggleAllDay(){
    _state = state.copyWith(isAllDay: !state.isAllDay);
    notifyListeners();
  }

  _addImages(List<XFile> images){
    _state.images!.addAll(images);
    notifyListeners();
  }

  _deleteImage(XFile image){
    _state.images!.remove(image);
    notifyListeners();
  }

  _updateDescription(String description){
    _state = state.copyWith(description: description.isNotEmpty ? description : '');
    notifyListeners();
  }

  _updateColor(Color color){
    _state = state.copyWith(color: color);
    notifyListeners();
  }

  _updateTitle(String? title){
    _state = state.copyWith(title: title ?? "");
    notifyListeners();
  }

  _insertOrUpdateEvent() async {
    ///validate
    if(_state.title == null || _state.title == ""){
      _addEventController.add( const AddEventUiEvent.notValid("타이틀을 입력해 주세요") );
    }else{

      /// create event object
      final event = _getEvent();

      /// decide insert or update act
      Result result = event.seq == null
          ? await eventRepository.insert(event)
          : await eventRepository.update(event);

      /// ui change
      if(result is Success){
        _addEventController.add( const AddEventUiEvent.eventSuccess() );
      }else{
        _addEventController.add( const AddEventUiEvent.eventFailed('이벤트 추가에 실패했습니다.') );
      }
    }
  }

  _deleteEvent() async {
    Result result = await eventRepository.delete(_getEvent());

    /// ui change
    if(result is Success){
      _addEventController.add( const AddEventUiEvent.eventSuccess() );
    }else{
      _addEventController.add( const AddEventUiEvent.eventFailed('이벤트 삭제에 실패했습니다.') );
    }
  }

}