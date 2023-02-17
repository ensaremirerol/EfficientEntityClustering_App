// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cluster_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchClusterState {
  String? get searchQuery => throw _privateConstructorUsedError;
  List<ClusterModel> get clusters => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchClusterStateCopyWith<SearchClusterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchClusterStateCopyWith<$Res> {
  factory $SearchClusterStateCopyWith(
          SearchClusterState value, $Res Function(SearchClusterState) then) =
      _$SearchClusterStateCopyWithImpl<$Res, SearchClusterState>;
  @useResult
  $Res call({String? searchQuery, List<ClusterModel> clusters, bool isLoading});
}

/// @nodoc
class _$SearchClusterStateCopyWithImpl<$Res, $Val extends SearchClusterState>
    implements $SearchClusterStateCopyWith<$Res> {
  _$SearchClusterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? clusters = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      clusters: null == clusters
          ? _value.clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchClusterStateCopyWith<$Res>
    implements $SearchClusterStateCopyWith<$Res> {
  factory _$$_SearchClusterStateCopyWith(_$_SearchClusterState value,
          $Res Function(_$_SearchClusterState) then) =
      __$$_SearchClusterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? searchQuery, List<ClusterModel> clusters, bool isLoading});
}

/// @nodoc
class __$$_SearchClusterStateCopyWithImpl<$Res>
    extends _$SearchClusterStateCopyWithImpl<$Res, _$_SearchClusterState>
    implements _$$_SearchClusterStateCopyWith<$Res> {
  __$$_SearchClusterStateCopyWithImpl(
      _$_SearchClusterState _value, $Res Function(_$_SearchClusterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchQuery = freezed,
    Object? clusters = null,
    Object? isLoading = null,
  }) {
    return _then(_$_SearchClusterState(
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      clusters: null == clusters
          ? _value._clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<ClusterModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SearchClusterState implements _SearchClusterState {
  _$_SearchClusterState(
      {required this.searchQuery,
      required final List<ClusterModel> clusters,
      required this.isLoading})
      : _clusters = clusters;

  @override
  final String? searchQuery;
  final List<ClusterModel> _clusters;
  @override
  List<ClusterModel> get clusters {
    if (_clusters is EqualUnmodifiableListView) return _clusters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_clusters);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'SearchClusterState(searchQuery: $searchQuery, clusters: $clusters, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchClusterState &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._clusters, _clusters) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchQuery,
      const DeepCollectionEquality().hash(_clusters), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchClusterStateCopyWith<_$_SearchClusterState> get copyWith =>
      __$$_SearchClusterStateCopyWithImpl<_$_SearchClusterState>(
          this, _$identity);
}

abstract class _SearchClusterState implements SearchClusterState {
  factory _SearchClusterState(
      {required final String? searchQuery,
      required final List<ClusterModel> clusters,
      required final bool isLoading}) = _$_SearchClusterState;

  @override
  String? get searchQuery;
  @override
  List<ClusterModel> get clusters;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_SearchClusterStateCopyWith<_$_SearchClusterState> get copyWith =>
      throw _privateConstructorUsedError;
}
