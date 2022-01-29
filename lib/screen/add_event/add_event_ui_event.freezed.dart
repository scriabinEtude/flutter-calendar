// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_event_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddEventUiEventTearOff {
  const _$AddEventUiEventTearOff();

  NotValid notValid(String message) {
    return NotValid(
      message,
    );
  }

  EventSuccess eventSuccess() {
    return const EventSuccess();
  }

  EventFailed eventFailed(String message) {
    return EventFailed(
      message,
    );
  }
}

/// @nodoc
const $AddEventUiEvent = _$AddEventUiEventTearOff();

/// @nodoc
mixin _$AddEventUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notValid,
    required TResult Function() eventSuccess,
    required TResult Function(String message) eventFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotValid value) notValid,
    required TResult Function(EventSuccess value) eventSuccess,
    required TResult Function(EventFailed value) eventFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddEventUiEventCopyWith<$Res> {
  factory $AddEventUiEventCopyWith(
          AddEventUiEvent value, $Res Function(AddEventUiEvent) then) =
      _$AddEventUiEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddEventUiEventCopyWithImpl<$Res>
    implements $AddEventUiEventCopyWith<$Res> {
  _$AddEventUiEventCopyWithImpl(this._value, this._then);

  final AddEventUiEvent _value;
  // ignore: unused_field
  final $Res Function(AddEventUiEvent) _then;
}

/// @nodoc
abstract class $NotValidCopyWith<$Res> {
  factory $NotValidCopyWith(NotValid value, $Res Function(NotValid) then) =
      _$NotValidCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$NotValidCopyWithImpl<$Res> extends _$AddEventUiEventCopyWithImpl<$Res>
    implements $NotValidCopyWith<$Res> {
  _$NotValidCopyWithImpl(NotValid _value, $Res Function(NotValid) _then)
      : super(_value, (v) => _then(v as NotValid));

  @override
  NotValid get _value => super._value as NotValid;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(NotValid(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotValid implements NotValid {
  const _$NotValid(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddEventUiEvent.notValid(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotValid &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $NotValidCopyWith<NotValid> get copyWith =>
      _$NotValidCopyWithImpl<NotValid>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notValid,
    required TResult Function() eventSuccess,
    required TResult Function(String message) eventFailed,
  }) {
    return notValid(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
  }) {
    return notValid?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
    required TResult orElse(),
  }) {
    if (notValid != null) {
      return notValid(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotValid value) notValid,
    required TResult Function(EventSuccess value) eventSuccess,
    required TResult Function(EventFailed value) eventFailed,
  }) {
    return notValid(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
  }) {
    return notValid?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
    required TResult orElse(),
  }) {
    if (notValid != null) {
      return notValid(this);
    }
    return orElse();
  }
}

abstract class NotValid implements AddEventUiEvent {
  const factory NotValid(String message) = _$NotValid;

  String get message;
  @JsonKey(ignore: true)
  $NotValidCopyWith<NotValid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSuccessCopyWith<$Res> {
  factory $EventSuccessCopyWith(
          EventSuccess value, $Res Function(EventSuccess) then) =
      _$EventSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$EventSuccessCopyWithImpl<$Res>
    extends _$AddEventUiEventCopyWithImpl<$Res>
    implements $EventSuccessCopyWith<$Res> {
  _$EventSuccessCopyWithImpl(
      EventSuccess _value, $Res Function(EventSuccess) _then)
      : super(_value, (v) => _then(v as EventSuccess));

  @override
  EventSuccess get _value => super._value as EventSuccess;
}

/// @nodoc

class _$EventSuccess implements EventSuccess {
  const _$EventSuccess();

  @override
  String toString() {
    return 'AddEventUiEvent.eventSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EventSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notValid,
    required TResult Function() eventSuccess,
    required TResult Function(String message) eventFailed,
  }) {
    return eventSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
  }) {
    return eventSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
    required TResult orElse(),
  }) {
    if (eventSuccess != null) {
      return eventSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotValid value) notValid,
    required TResult Function(EventSuccess value) eventSuccess,
    required TResult Function(EventFailed value) eventFailed,
  }) {
    return eventSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
  }) {
    return eventSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
    required TResult orElse(),
  }) {
    if (eventSuccess != null) {
      return eventSuccess(this);
    }
    return orElse();
  }
}

abstract class EventSuccess implements AddEventUiEvent {
  const factory EventSuccess() = _$EventSuccess;
}

/// @nodoc
abstract class $EventFailedCopyWith<$Res> {
  factory $EventFailedCopyWith(
          EventFailed value, $Res Function(EventFailed) then) =
      _$EventFailedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$EventFailedCopyWithImpl<$Res>
    extends _$AddEventUiEventCopyWithImpl<$Res>
    implements $EventFailedCopyWith<$Res> {
  _$EventFailedCopyWithImpl(
      EventFailed _value, $Res Function(EventFailed) _then)
      : super(_value, (v) => _then(v as EventFailed));

  @override
  EventFailed get _value => super._value as EventFailed;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(EventFailed(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventFailed implements EventFailed {
  const _$EventFailed(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddEventUiEvent.eventFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EventFailed &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $EventFailedCopyWith<EventFailed> get copyWith =>
      _$EventFailedCopyWithImpl<EventFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) notValid,
    required TResult Function() eventSuccess,
    required TResult Function(String message) eventFailed,
  }) {
    return eventFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
  }) {
    return eventFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? notValid,
    TResult Function()? eventSuccess,
    TResult Function(String message)? eventFailed,
    required TResult orElse(),
  }) {
    if (eventFailed != null) {
      return eventFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NotValid value) notValid,
    required TResult Function(EventSuccess value) eventSuccess,
    required TResult Function(EventFailed value) eventFailed,
  }) {
    return eventFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
  }) {
    return eventFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NotValid value)? notValid,
    TResult Function(EventSuccess value)? eventSuccess,
    TResult Function(EventFailed value)? eventFailed,
    required TResult orElse(),
  }) {
    if (eventFailed != null) {
      return eventFailed(this);
    }
    return orElse();
  }
}

abstract class EventFailed implements AddEventUiEvent {
  const factory EventFailed(String message) = _$EventFailed;

  String get message;
  @JsonKey(ignore: true)
  $EventFailedCopyWith<EventFailed> get copyWith =>
      throw _privateConstructorUsedError;
}
