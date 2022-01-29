// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarStateTearOff {
  const _$CalendarStateTearOff();

  _AddEventState call({required List<Event> events}) {
    return _AddEventState(
      events: events,
    );
  }
}

/// @nodoc
const $CalendarState = _$CalendarStateTearOff();

/// @nodoc
mixin _$CalendarState {
  List<Event> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res>;
  $Res call({List<Event> events});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  final CalendarState _value;
  // ignore: unused_field
  final $Res Function(CalendarState) _then;

  @override
  $Res call({
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc
abstract class _$AddEventStateCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$AddEventStateCopyWith(
          _AddEventState value, $Res Function(_AddEventState) then) =
      __$AddEventStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Event> events});
}

/// @nodoc
class __$AddEventStateCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res>
    implements _$AddEventStateCopyWith<$Res> {
  __$AddEventStateCopyWithImpl(
      _AddEventState _value, $Res Function(_AddEventState) _then)
      : super(_value, (v) => _then(v as _AddEventState));

  @override
  _AddEventState get _value => super._value as _AddEventState;

  @override
  $Res call({
    Object? events = freezed,
  }) {
    return _then(_AddEventState(
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc

class _$_AddEventState implements _AddEventState {
  const _$_AddEventState({required this.events});

  @override
  final List<Event> events;

  @override
  String toString() {
    return 'CalendarState(events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddEventState &&
            const DeepCollectionEquality().equals(other.events, events));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(events));

  @JsonKey(ignore: true)
  @override
  _$AddEventStateCopyWith<_AddEventState> get copyWith =>
      __$AddEventStateCopyWithImpl<_AddEventState>(this, _$identity);
}

abstract class _AddEventState implements CalendarState {
  const factory _AddEventState({required List<Event> events}) =
      _$_AddEventState;

  @override
  List<Event> get events;
  @override
  @JsonKey(ignore: true)
  _$AddEventStateCopyWith<_AddEventState> get copyWith =>
      throw _privateConstructorUsedError;
}
