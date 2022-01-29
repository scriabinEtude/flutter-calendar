// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_ui_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarUiEventTearOff {
  const _$CalendarUiEventTearOff();

  LoadFailed loadFailed(String message) {
    return LoadFailed(
      message,
    );
  }

  Refresh refresh() {
    return const Refresh();
  }
}

/// @nodoc
const $CalendarUiEvent = _$CalendarUiEventTearOff();

/// @nodoc
mixin _$CalendarUiEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) loadFailed,
    required TResult Function() refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFailed value) loadFailed,
    required TResult Function(Refresh value) refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarUiEventCopyWith<$Res> {
  factory $CalendarUiEventCopyWith(
          CalendarUiEvent value, $Res Function(CalendarUiEvent) then) =
      _$CalendarUiEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CalendarUiEventCopyWithImpl<$Res>
    implements $CalendarUiEventCopyWith<$Res> {
  _$CalendarUiEventCopyWithImpl(this._value, this._then);

  final CalendarUiEvent _value;
  // ignore: unused_field
  final $Res Function(CalendarUiEvent) _then;
}

/// @nodoc
abstract class $LoadFailedCopyWith<$Res> {
  factory $LoadFailedCopyWith(
          LoadFailed value, $Res Function(LoadFailed) then) =
      _$LoadFailedCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$LoadFailedCopyWithImpl<$Res> extends _$CalendarUiEventCopyWithImpl<$Res>
    implements $LoadFailedCopyWith<$Res> {
  _$LoadFailedCopyWithImpl(LoadFailed _value, $Res Function(LoadFailed) _then)
      : super(_value, (v) => _then(v as LoadFailed));

  @override
  LoadFailed get _value => super._value as LoadFailed;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(LoadFailed(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadFailed implements LoadFailed {
  const _$LoadFailed(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CalendarUiEvent.loadFailed(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadFailed &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $LoadFailedCopyWith<LoadFailed> get copyWith =>
      _$LoadFailedCopyWithImpl<LoadFailed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) loadFailed,
    required TResult Function() refresh,
  }) {
    return loadFailed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
  }) {
    return loadFailed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFailed value) loadFailed,
    required TResult Function(Refresh value) refresh,
  }) {
    return loadFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
  }) {
    return loadFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (loadFailed != null) {
      return loadFailed(this);
    }
    return orElse();
  }
}

abstract class LoadFailed implements CalendarUiEvent {
  const factory LoadFailed(String message) = _$LoadFailed;

  String get message;
  @JsonKey(ignore: true)
  $LoadFailedCopyWith<LoadFailed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshCopyWith<$Res> {
  factory $RefreshCopyWith(Refresh value, $Res Function(Refresh) then) =
      _$RefreshCopyWithImpl<$Res>;
}

/// @nodoc
class _$RefreshCopyWithImpl<$Res> extends _$CalendarUiEventCopyWithImpl<$Res>
    implements $RefreshCopyWith<$Res> {
  _$RefreshCopyWithImpl(Refresh _value, $Res Function(Refresh) _then)
      : super(_value, (v) => _then(v as Refresh));

  @override
  Refresh get _value => super._value as Refresh;
}

/// @nodoc

class _$Refresh implements Refresh {
  const _$Refresh();

  @override
  String toString() {
    return 'CalendarUiEvent.refresh()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) loadFailed,
    required TResult Function() refresh,
  }) {
    return refresh();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
  }) {
    return refresh?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? loadFailed,
    TResult Function()? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadFailed value) loadFailed,
    required TResult Function(Refresh value) refresh,
  }) {
    return refresh(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
  }) {
    return refresh?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadFailed value)? loadFailed,
    TResult Function(Refresh value)? refresh,
    required TResult orElse(),
  }) {
    if (refresh != null) {
      return refresh(this);
    }
    return orElse();
  }
}

abstract class Refresh implements CalendarUiEvent {
  const factory Refresh() = _$Refresh;
}
