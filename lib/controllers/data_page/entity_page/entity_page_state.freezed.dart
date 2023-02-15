// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EntityPageState {
  List<EntityModel> get entityList => throw _privateConstructorUsedError;
  Set<String> get selectedEntityIds => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  int? get sortColumnIndex => throw _privateConstructorUsedError;
  bool? get isAscending => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntityPageStateCopyWith<EntityPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityPageStateCopyWith<$Res> {
  factory $EntityPageStateCopyWith(
          EntityPageState value, $Res Function(EntityPageState) then) =
      _$EntityPageStateCopyWithImpl<$Res, EntityPageState>;
  @useResult
  $Res call(
      {List<EntityModel> entityList,
      Set<String> selectedEntityIds,
      String? searchQuery,
      int? sortColumnIndex,
      bool? isAscending,
      bool isLoading});
}

/// @nodoc
class _$EntityPageStateCopyWithImpl<$Res, $Val extends EntityPageState>
    implements $EntityPageStateCopyWith<$Res> {
  _$EntityPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityList = null,
    Object? selectedEntityIds = null,
    Object? searchQuery = freezed,
    Object? sortColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      entityList: null == entityList
          ? _value.entityList
          : entityList // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
      selectedEntityIds: null == selectedEntityIds
          ? _value.selectedEntityIds
          : selectedEntityIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      sortColumnIndex: freezed == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isAscending: freezed == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntityPageStateCopyWith<$Res>
    implements $EntityPageStateCopyWith<$Res> {
  factory _$$_EntityPageStateCopyWith(
          _$_EntityPageState value, $Res Function(_$_EntityPageState) then) =
      __$$_EntityPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EntityModel> entityList,
      Set<String> selectedEntityIds,
      String? searchQuery,
      int? sortColumnIndex,
      bool? isAscending,
      bool isLoading});
}

/// @nodoc
class __$$_EntityPageStateCopyWithImpl<$Res>
    extends _$EntityPageStateCopyWithImpl<$Res, _$_EntityPageState>
    implements _$$_EntityPageStateCopyWith<$Res> {
  __$$_EntityPageStateCopyWithImpl(
      _$_EntityPageState _value, $Res Function(_$_EntityPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityList = null,
    Object? selectedEntityIds = null,
    Object? searchQuery = freezed,
    Object? sortColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_EntityPageState(
      entityList: null == entityList
          ? _value._entityList
          : entityList // ignore: cast_nullable_to_non_nullable
              as List<EntityModel>,
      selectedEntityIds: null == selectedEntityIds
          ? _value._selectedEntityIds
          : selectedEntityIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      sortColumnIndex: freezed == sortColumnIndex
          ? _value.sortColumnIndex
          : sortColumnIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      isAscending: freezed == isAscending
          ? _value.isAscending
          : isAscending // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EntityPageState implements _EntityPageState {
  _$_EntityPageState(
      {required final List<EntityModel> entityList,
      required final Set<String> selectedEntityIds,
      required this.searchQuery,
      required this.sortColumnIndex,
      required this.isAscending,
      required this.isLoading})
      : _entityList = entityList,
        _selectedEntityIds = selectedEntityIds;

  final List<EntityModel> _entityList;
  @override
  List<EntityModel> get entityList {
    if (_entityList is EqualUnmodifiableListView) return _entityList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entityList);
  }

  final Set<String> _selectedEntityIds;
  @override
  Set<String> get selectedEntityIds {
    if (_selectedEntityIds is EqualUnmodifiableSetView)
      return _selectedEntityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedEntityIds);
  }

  @override
  final String? searchQuery;
  @override
  final int? sortColumnIndex;
  @override
  final bool? isAscending;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'EntityPageState(entityList: $entityList, selectedEntityIds: $selectedEntityIds, searchQuery: $searchQuery, sortColumnIndex: $sortColumnIndex, isAscending: $isAscending, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityPageState &&
            const DeepCollectionEquality()
                .equals(other._entityList, _entityList) &&
            const DeepCollectionEquality()
                .equals(other._selectedEntityIds, _selectedEntityIds) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.sortColumnIndex, sortColumnIndex) ||
                other.sortColumnIndex == sortColumnIndex) &&
            (identical(other.isAscending, isAscending) ||
                other.isAscending == isAscending) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entityList),
      const DeepCollectionEquality().hash(_selectedEntityIds),
      searchQuery,
      sortColumnIndex,
      isAscending,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntityPageStateCopyWith<_$_EntityPageState> get copyWith =>
      __$$_EntityPageStateCopyWithImpl<_$_EntityPageState>(this, _$identity);
}

abstract class _EntityPageState implements EntityPageState {
  factory _EntityPageState(
      {required final List<EntityModel> entityList,
      required final Set<String> selectedEntityIds,
      required final String? searchQuery,
      required final int? sortColumnIndex,
      required final bool? isAscending,
      required final bool isLoading}) = _$_EntityPageState;

  @override
  List<EntityModel> get entityList;
  @override
  Set<String> get selectedEntityIds;
  @override
  String? get searchQuery;
  @override
  int? get sortColumnIndex;
  @override
  bool? get isAscending;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_EntityPageStateCopyWith<_$_EntityPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
