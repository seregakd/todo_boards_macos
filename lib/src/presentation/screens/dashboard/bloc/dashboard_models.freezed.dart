// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dashboard_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInfo,
    required TResult Function(String name) addProject,
    required TResult Function(int index, String name) changeProjectName,
    required TResult Function(int index) delProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetInfoEvent value) getInfo,
    required TResult Function(AddProjectEvent value) addProject,
    required TResult Function(ChangeProjectNameEvent value) changeProjectName,
    required TResult Function(DelProjectEvent value) delProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardScreenEventCopyWith<$Res> {
  factory $DashboardScreenEventCopyWith(DashboardScreenEvent value,
          $Res Function(DashboardScreenEvent) then) =
      _$DashboardScreenEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DashboardScreenEventCopyWithImpl<$Res>
    implements $DashboardScreenEventCopyWith<$Res> {
  _$DashboardScreenEventCopyWithImpl(this._value, this._then);

  final DashboardScreenEvent _value;
  // ignore: unused_field
  final $Res Function(DashboardScreenEvent) _then;
}

/// @nodoc
abstract class _$$GetInfoEventCopyWith<$Res> {
  factory _$$GetInfoEventCopyWith(
          _$GetInfoEvent value, $Res Function(_$GetInfoEvent) then) =
      __$$GetInfoEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetInfoEventCopyWithImpl<$Res>
    extends _$DashboardScreenEventCopyWithImpl<$Res>
    implements _$$GetInfoEventCopyWith<$Res> {
  __$$GetInfoEventCopyWithImpl(
      _$GetInfoEvent _value, $Res Function(_$GetInfoEvent) _then)
      : super(_value, (v) => _then(v as _$GetInfoEvent));

  @override
  _$GetInfoEvent get _value => super._value as _$GetInfoEvent;
}

/// @nodoc

class _$GetInfoEvent implements GetInfoEvent {
  _$GetInfoEvent();

  @override
  String toString() {
    return 'DashboardScreenEvent.getInfo()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetInfoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInfo,
    required TResult Function(String name) addProject,
    required TResult Function(int index, String name) changeProjectName,
    required TResult Function(int index) delProject,
  }) {
    return getInfo();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
  }) {
    return getInfo?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
    required TResult orElse(),
  }) {
    if (getInfo != null) {
      return getInfo();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetInfoEvent value) getInfo,
    required TResult Function(AddProjectEvent value) addProject,
    required TResult Function(ChangeProjectNameEvent value) changeProjectName,
    required TResult Function(DelProjectEvent value) delProject,
  }) {
    return getInfo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
  }) {
    return getInfo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
    required TResult orElse(),
  }) {
    if (getInfo != null) {
      return getInfo(this);
    }
    return orElse();
  }
}

abstract class GetInfoEvent implements DashboardScreenEvent {
  factory GetInfoEvent() = _$GetInfoEvent;
}

/// @nodoc
abstract class _$$AddProjectEventCopyWith<$Res> {
  factory _$$AddProjectEventCopyWith(
          _$AddProjectEvent value, $Res Function(_$AddProjectEvent) then) =
      __$$AddProjectEventCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$$AddProjectEventCopyWithImpl<$Res>
    extends _$DashboardScreenEventCopyWithImpl<$Res>
    implements _$$AddProjectEventCopyWith<$Res> {
  __$$AddProjectEventCopyWithImpl(
      _$AddProjectEvent _value, $Res Function(_$AddProjectEvent) _then)
      : super(_value, (v) => _then(v as _$AddProjectEvent));

  @override
  _$AddProjectEvent get _value => super._value as _$AddProjectEvent;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$AddProjectEvent(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddProjectEvent implements AddProjectEvent {
  _$AddProjectEvent({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'DashboardScreenEvent.addProject(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProjectEvent &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$AddProjectEventCopyWith<_$AddProjectEvent> get copyWith =>
      __$$AddProjectEventCopyWithImpl<_$AddProjectEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInfo,
    required TResult Function(String name) addProject,
    required TResult Function(int index, String name) changeProjectName,
    required TResult Function(int index) delProject,
  }) {
    return addProject(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
  }) {
    return addProject?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
    required TResult orElse(),
  }) {
    if (addProject != null) {
      return addProject(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetInfoEvent value) getInfo,
    required TResult Function(AddProjectEvent value) addProject,
    required TResult Function(ChangeProjectNameEvent value) changeProjectName,
    required TResult Function(DelProjectEvent value) delProject,
  }) {
    return addProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
  }) {
    return addProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
    required TResult orElse(),
  }) {
    if (addProject != null) {
      return addProject(this);
    }
    return orElse();
  }
}

abstract class AddProjectEvent implements DashboardScreenEvent {
  factory AddProjectEvent({required final String name}) = _$AddProjectEvent;

  String get name;
  @JsonKey(ignore: true)
  _$$AddProjectEventCopyWith<_$AddProjectEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeProjectNameEventCopyWith<$Res> {
  factory _$$ChangeProjectNameEventCopyWith(_$ChangeProjectNameEvent value,
          $Res Function(_$ChangeProjectNameEvent) then) =
      __$$ChangeProjectNameEventCopyWithImpl<$Res>;
  $Res call({int index, String name});
}

/// @nodoc
class __$$ChangeProjectNameEventCopyWithImpl<$Res>
    extends _$DashboardScreenEventCopyWithImpl<$Res>
    implements _$$ChangeProjectNameEventCopyWith<$Res> {
  __$$ChangeProjectNameEventCopyWithImpl(_$ChangeProjectNameEvent _value,
      $Res Function(_$ChangeProjectNameEvent) _then)
      : super(_value, (v) => _then(v as _$ChangeProjectNameEvent));

  @override
  _$ChangeProjectNameEvent get _value =>
      super._value as _$ChangeProjectNameEvent;

  @override
  $Res call({
    Object? index = freezed,
    Object? name = freezed,
  }) {
    return _then(_$ChangeProjectNameEvent(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeProjectNameEvent implements ChangeProjectNameEvent {
  _$ChangeProjectNameEvent({required this.index, required this.name});

  @override
  final int index;
  @override
  final String name;

  @override
  String toString() {
    return 'DashboardScreenEvent.changeProjectName(index: $index, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeProjectNameEvent &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$ChangeProjectNameEventCopyWith<_$ChangeProjectNameEvent> get copyWith =>
      __$$ChangeProjectNameEventCopyWithImpl<_$ChangeProjectNameEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInfo,
    required TResult Function(String name) addProject,
    required TResult Function(int index, String name) changeProjectName,
    required TResult Function(int index) delProject,
  }) {
    return changeProjectName(index, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
  }) {
    return changeProjectName?.call(index, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
    required TResult orElse(),
  }) {
    if (changeProjectName != null) {
      return changeProjectName(index, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetInfoEvent value) getInfo,
    required TResult Function(AddProjectEvent value) addProject,
    required TResult Function(ChangeProjectNameEvent value) changeProjectName,
    required TResult Function(DelProjectEvent value) delProject,
  }) {
    return changeProjectName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
  }) {
    return changeProjectName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
    required TResult orElse(),
  }) {
    if (changeProjectName != null) {
      return changeProjectName(this);
    }
    return orElse();
  }
}

abstract class ChangeProjectNameEvent implements DashboardScreenEvent {
  factory ChangeProjectNameEvent(
      {required final int index,
      required final String name}) = _$ChangeProjectNameEvent;

  int get index;
  String get name;
  @JsonKey(ignore: true)
  _$$ChangeProjectNameEventCopyWith<_$ChangeProjectNameEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DelProjectEventCopyWith<$Res> {
  factory _$$DelProjectEventCopyWith(
          _$DelProjectEvent value, $Res Function(_$DelProjectEvent) then) =
      __$$DelProjectEventCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$$DelProjectEventCopyWithImpl<$Res>
    extends _$DashboardScreenEventCopyWithImpl<$Res>
    implements _$$DelProjectEventCopyWith<$Res> {
  __$$DelProjectEventCopyWithImpl(
      _$DelProjectEvent _value, $Res Function(_$DelProjectEvent) _then)
      : super(_value, (v) => _then(v as _$DelProjectEvent));

  @override
  _$DelProjectEvent get _value => super._value as _$DelProjectEvent;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$DelProjectEvent(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DelProjectEvent implements DelProjectEvent {
  _$DelProjectEvent({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'DashboardScreenEvent.delProject(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DelProjectEvent &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$DelProjectEventCopyWith<_$DelProjectEvent> get copyWith =>
      __$$DelProjectEventCopyWithImpl<_$DelProjectEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInfo,
    required TResult Function(String name) addProject,
    required TResult Function(int index, String name) changeProjectName,
    required TResult Function(int index) delProject,
  }) {
    return delProject(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
  }) {
    return delProject?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInfo,
    TResult Function(String name)? addProject,
    TResult Function(int index, String name)? changeProjectName,
    TResult Function(int index)? delProject,
    required TResult orElse(),
  }) {
    if (delProject != null) {
      return delProject(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetInfoEvent value) getInfo,
    required TResult Function(AddProjectEvent value) addProject,
    required TResult Function(ChangeProjectNameEvent value) changeProjectName,
    required TResult Function(DelProjectEvent value) delProject,
  }) {
    return delProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
  }) {
    return delProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetInfoEvent value)? getInfo,
    TResult Function(AddProjectEvent value)? addProject,
    TResult Function(ChangeProjectNameEvent value)? changeProjectName,
    TResult Function(DelProjectEvent value)? delProject,
    required TResult orElse(),
  }) {
    if (delProject != null) {
      return delProject(this);
    }
    return orElse();
  }
}

abstract class DelProjectEvent implements DashboardScreenEvent {
  factory DelProjectEvent({required final int index}) = _$DelProjectEvent;

  int get index;
  @JsonKey(ignore: true)
  _$$DelProjectEventCopyWith<_$DelProjectEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardScreenState {
  List<ProjectModel> get projects => throw _privateConstructorUsedError;
  List<CardModel> get cards => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProjectModel> projects, List<CardModel> cards)
        data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProjectModel> projects, List<CardModel> cards)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProjectModel> projects, List<CardModel> cards)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardScreenStateData value) data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashboardScreenStateData value)? data,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardScreenStateData value)? data,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardScreenStateCopyWith<DashboardScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardScreenStateCopyWith<$Res> {
  factory $DashboardScreenStateCopyWith(DashboardScreenState value,
          $Res Function(DashboardScreenState) then) =
      _$DashboardScreenStateCopyWithImpl<$Res>;
  $Res call({List<ProjectModel> projects, List<CardModel> cards});
}

/// @nodoc
class _$DashboardScreenStateCopyWithImpl<$Res>
    implements $DashboardScreenStateCopyWith<$Res> {
  _$DashboardScreenStateCopyWithImpl(this._value, this._then);

  final DashboardScreenState _value;
  // ignore: unused_field
  final $Res Function(DashboardScreenState) _then;

  @override
  $Res call({
    Object? projects = freezed,
    Object? cards = freezed,
  }) {
    return _then(_value.copyWith(
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      cards: cards == freezed
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc
abstract class _$$DashboardScreenStateDataCopyWith<$Res>
    implements $DashboardScreenStateCopyWith<$Res> {
  factory _$$DashboardScreenStateDataCopyWith(_$DashboardScreenStateData value,
          $Res Function(_$DashboardScreenStateData) then) =
      __$$DashboardScreenStateDataCopyWithImpl<$Res>;
  @override
  $Res call({List<ProjectModel> projects, List<CardModel> cards});
}

/// @nodoc
class __$$DashboardScreenStateDataCopyWithImpl<$Res>
    extends _$DashboardScreenStateCopyWithImpl<$Res>
    implements _$$DashboardScreenStateDataCopyWith<$Res> {
  __$$DashboardScreenStateDataCopyWithImpl(_$DashboardScreenStateData _value,
      $Res Function(_$DashboardScreenStateData) _then)
      : super(_value, (v) => _then(v as _$DashboardScreenStateData));

  @override
  _$DashboardScreenStateData get _value =>
      super._value as _$DashboardScreenStateData;

  @override
  $Res call({
    Object? projects = freezed,
    Object? cards = freezed,
  }) {
    return _then(_$DashboardScreenStateData(
      projects: projects == freezed
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>,
      cards: cards == freezed
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardModel>,
    ));
  }
}

/// @nodoc

class _$DashboardScreenStateData extends DashboardScreenStateData {
  _$DashboardScreenStateData(
      {final List<ProjectModel> projects = const [],
      final List<CardModel> cards = const []})
      : _projects = projects,
        _cards = cards,
        super._();

  final List<ProjectModel> _projects;
  @override
  @JsonKey()
  List<ProjectModel> get projects {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  final List<CardModel> _cards;
  @override
  @JsonKey()
  List<CardModel> get cards {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'DashboardScreenState.data(projects: $projects, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardScreenStateData &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  _$$DashboardScreenStateDataCopyWith<_$DashboardScreenStateData>
      get copyWith =>
          __$$DashboardScreenStateDataCopyWithImpl<_$DashboardScreenStateData>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<ProjectModel> projects, List<CardModel> cards)
        data,
  }) {
    return data(projects, cards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<ProjectModel> projects, List<CardModel> cards)? data,
  }) {
    return data?.call(projects, cards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProjectModel> projects, List<CardModel> cards)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(projects, cards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardScreenStateData value) data,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DashboardScreenStateData value)? data,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardScreenStateData value)? data,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class DashboardScreenStateData extends DashboardScreenState {
  factory DashboardScreenStateData(
      {final List<ProjectModel> projects,
      final List<CardModel> cards}) = _$DashboardScreenStateData;
  DashboardScreenStateData._() : super._();

  @override
  List<ProjectModel> get projects;
  @override
  List<CardModel> get cards;
  @override
  @JsonKey(ignore: true)
  _$$DashboardScreenStateDataCopyWith<_$DashboardScreenStateData>
      get copyWith => throw _privateConstructorUsedError;
}
