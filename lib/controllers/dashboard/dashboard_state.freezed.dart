// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DashboardState {
  int get totalEnities => throw _privateConstructorUsedError;
  int get totalLabledEnities => throw _privateConstructorUsedError;
  int get totalClusters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({int totalEnities, int totalLabledEnities, int totalClusters});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEnities = null,
    Object? totalLabledEnities = null,
    Object? totalClusters = null,
  }) {
    return _then(_value.copyWith(
      totalEnities: null == totalEnities
          ? _value.totalEnities
          : totalEnities // ignore: cast_nullable_to_non_nullable
              as int,
      totalLabledEnities: null == totalLabledEnities
          ? _value.totalLabledEnities
          : totalLabledEnities // ignore: cast_nullable_to_non_nullable
              as int,
      totalClusters: null == totalClusters
          ? _value.totalClusters
          : totalClusters // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_DashboardStateCopyWith(
          _$_DashboardState value, $Res Function(_$_DashboardState) then) =
      __$$_DashboardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalEnities, int totalLabledEnities, int totalClusters});
}

/// @nodoc
class __$$_DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_DashboardState>
    implements _$$_DashboardStateCopyWith<$Res> {
  __$$_DashboardStateCopyWithImpl(
      _$_DashboardState _value, $Res Function(_$_DashboardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalEnities = null,
    Object? totalLabledEnities = null,
    Object? totalClusters = null,
  }) {
    return _then(_$_DashboardState(
      totalEnities: null == totalEnities
          ? _value.totalEnities
          : totalEnities // ignore: cast_nullable_to_non_nullable
              as int,
      totalLabledEnities: null == totalLabledEnities
          ? _value.totalLabledEnities
          : totalLabledEnities // ignore: cast_nullable_to_non_nullable
              as int,
      totalClusters: null == totalClusters
          ? _value.totalClusters
          : totalClusters // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DashboardState implements _DashboardState {
  _$_DashboardState(
      {required this.totalEnities,
      required this.totalLabledEnities,
      required this.totalClusters});

  @override
  final int totalEnities;
  @override
  final int totalLabledEnities;
  @override
  final int totalClusters;

  @override
  String toString() {
    return 'DashboardState(totalEnities: $totalEnities, totalLabledEnities: $totalLabledEnities, totalClusters: $totalClusters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardState &&
            (identical(other.totalEnities, totalEnities) ||
                other.totalEnities == totalEnities) &&
            (identical(other.totalLabledEnities, totalLabledEnities) ||
                other.totalLabledEnities == totalLabledEnities) &&
            (identical(other.totalClusters, totalClusters) ||
                other.totalClusters == totalClusters));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalEnities, totalLabledEnities, totalClusters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      __$$_DashboardStateCopyWithImpl<_$_DashboardState>(this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  factory _DashboardState(
      {required final int totalEnities,
      required final int totalLabledEnities,
      required final int totalClusters}) = _$_DashboardState;

  @override
  int get totalEnities;
  @override
  int get totalLabledEnities;
  @override
  int get totalClusters;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
