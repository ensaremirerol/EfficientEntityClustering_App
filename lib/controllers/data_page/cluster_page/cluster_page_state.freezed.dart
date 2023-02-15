// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClusterPageState {
  List<ClusterModel> get clusterList => throw _privateConstructorUsedError;
  Set<String> get selectedClusterIds => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  int? get sortColumnIndex => throw _privateConstructorUsedError;
  bool? get isAscending => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ClusterPageStateCopyWith<ClusterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterPageStateCopyWith<$Res> {
  factory $ClusterPageStateCopyWith(
          ClusterPageState value, $Res Function(ClusterPageState) then) =
      _$ClusterPageStateCopyWithImpl<$Res, ClusterPageState>;
  @useResult
  $Res call(
      {List<ClusterModel> clusterList,
      Set<String> selectedClusterIds,
      String? searchQuery,
      int? sortColumnIndex,
      bool? isAscending,
      bool isLoading});
}

/// @nodoc
class _$ClusterPageStateCopyWithImpl<$Res, $Val extends ClusterPageState>
    implements $ClusterPageStateCopyWith<$Res> {
  _$ClusterPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clusterList = null,
    Object? selectedClusterIds = null,
    Object? searchQuery = freezed,
    Object? sortColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      clusterList: null == clusterList
          ? _value.clusterList
          : clusterList // ignore: cast_nullable_to_non_nullable
              as List<ClusterModel>,
      selectedClusterIds: null == selectedClusterIds
          ? _value.selectedClusterIds
          : selectedClusterIds // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ClusterPageStateCopyWith<$Res>
    implements $ClusterPageStateCopyWith<$Res> {
  factory _$$_ClusterPageStateCopyWith(
          _$_ClusterPageState value, $Res Function(_$_ClusterPageState) then) =
      __$$_ClusterPageStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ClusterModel> clusterList,
      Set<String> selectedClusterIds,
      String? searchQuery,
      int? sortColumnIndex,
      bool? isAscending,
      bool isLoading});
}

/// @nodoc
class __$$_ClusterPageStateCopyWithImpl<$Res>
    extends _$ClusterPageStateCopyWithImpl<$Res, _$_ClusterPageState>
    implements _$$_ClusterPageStateCopyWith<$Res> {
  __$$_ClusterPageStateCopyWithImpl(
      _$_ClusterPageState _value, $Res Function(_$_ClusterPageState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clusterList = null,
    Object? selectedClusterIds = null,
    Object? searchQuery = freezed,
    Object? sortColumnIndex = freezed,
    Object? isAscending = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$_ClusterPageState(
      clusterList: null == clusterList
          ? _value._clusterList
          : clusterList // ignore: cast_nullable_to_non_nullable
              as List<ClusterModel>,
      selectedClusterIds: null == selectedClusterIds
          ? _value._selectedClusterIds
          : selectedClusterIds // ignore: cast_nullable_to_non_nullable
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

class _$_ClusterPageState implements _ClusterPageState {
  _$_ClusterPageState(
      {required final List<ClusterModel> clusterList,
      required final Set<String> selectedClusterIds,
      required this.searchQuery,
      required this.sortColumnIndex,
      required this.isAscending,
      required this.isLoading})
      : _clusterList = clusterList,
        _selectedClusterIds = selectedClusterIds;

  final List<ClusterModel> _clusterList;
  @override
  List<ClusterModel> get clusterList {
    if (_clusterList is EqualUnmodifiableListView) return _clusterList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clusterList);
  }

  final Set<String> _selectedClusterIds;
  @override
  Set<String> get selectedClusterIds {
    if (_selectedClusterIds is EqualUnmodifiableSetView)
      return _selectedClusterIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedClusterIds);
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
    return 'ClusterPageState(clusterList: $clusterList, selectedClusterIds: $selectedClusterIds, searchQuery: $searchQuery, sortColumnIndex: $sortColumnIndex, isAscending: $isAscending, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClusterPageState &&
            const DeepCollectionEquality()
                .equals(other._clusterList, _clusterList) &&
            const DeepCollectionEquality()
                .equals(other._selectedClusterIds, _selectedClusterIds) &&
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
      const DeepCollectionEquality().hash(_clusterList),
      const DeepCollectionEquality().hash(_selectedClusterIds),
      searchQuery,
      sortColumnIndex,
      isAscending,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClusterPageStateCopyWith<_$_ClusterPageState> get copyWith =>
      __$$_ClusterPageStateCopyWithImpl<_$_ClusterPageState>(this, _$identity);
}

abstract class _ClusterPageState implements ClusterPageState {
  factory _ClusterPageState(
      {required final List<ClusterModel> clusterList,
      required final Set<String> selectedClusterIds,
      required final String? searchQuery,
      required final int? sortColumnIndex,
      required final bool? isAscending,
      required final bool isLoading}) = _$_ClusterPageState;

  @override
  List<ClusterModel> get clusterList;
  @override
  Set<String> get selectedClusterIds;
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
  _$$_ClusterPageStateCopyWith<_$_ClusterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
