// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarEventTearOff {
  const _$CalendarEventTearOff();

  SelectAllEvents selectAllEvents() {
    return const SelectAllEvents();
  }
}

/// @nodoc
const $CalendarEvent = _$CalendarEventTearOff();

/// @nodoc
mixin _$CalendarEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectAllEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? selectAllEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectAllEvents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectAllEvents value) selectAllEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SelectAllEvents value)? selectAllEvents,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectAllEvents value)? selectAllEvents,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  final CalendarEvent _value;
  // ignore: unused_field
  final $Res Function(CalendarEvent) _then;
}

/// @nodoc
abstract class $SelectAllEventsCopyWith<$Res> {
  factory $SelectAllEventsCopyWith(
          SelectAllEvents value, $Res Function(SelectAllEvents) then) =
      _$SelectAllEventsCopyWithImpl<$Res>;
}

/// @nodoc
class _$SelectAllEventsCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res>
    implements $SelectAllEventsCopyWith<$Res> {
  _$SelectAllEventsCopyWithImpl(
      SelectAllEvents _value, $Res Function(SelectAllEvents) _then)
      : super(_value, (v) => _then(v as SelectAllEvents));

  @override
  SelectAllEvents get _value => super._value as SelectAllEvents;
}

/// @nodoc

class _$SelectAllEvents implements SelectAllEvents {
  const _$SelectAllEvents();

  @override
  String toString() {
    return 'CalendarEvent.selectAllEvents()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SelectAllEvents);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() selectAllEvents,
  }) {
    return selectAllEvents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? selectAllEvents,
  }) {
    return selectAllEvents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? selectAllEvents,
    required TResult orElse(),
  }) {
    if (selectAllEvents != null) {
      return selectAllEvents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectAllEvents value) selectAllEvents,
  }) {
    return selectAllEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SelectAllEvents value)? selectAllEvents,
  }) {
    return selectAllEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectAllEvents value)? selectAllEvents,
    required TResult orElse(),
  }) {
    if (selectAllEvents != null) {
      return selectAllEvents(this);
    }
    return orElse();
  }
}

abstract class SelectAllEvents implements CalendarEvent {
  const factory SelectAllEvents() = _$SelectAllEvents;
}
