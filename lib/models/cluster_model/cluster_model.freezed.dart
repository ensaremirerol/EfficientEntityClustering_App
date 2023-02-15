// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cluster_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClusterModel _$ClusterModelFromJson(Map<String, dynamic> json) {
  return _ClusterModel.fromJson(json);
}

/// @nodoc
mixin _$ClusterModel {
  String get cluster_id => throw _privateConstructorUsedError;
  String get cluster_name => throw _privateConstructorUsedError;
  List<String> get entity_ids => throw _privateConstructorUsedError;
  List<double> get cluster_vector => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClusterModelCopyWith<ClusterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterModelCopyWith<$Res> {
  factory $ClusterModelCopyWith(
          ClusterModel value, $Res Function(ClusterModel) then) =
      _$ClusterModelCopyWithImpl<$Res, ClusterModel>;
  @useResult
  $Res call(
      {String cluster_id,
      String cluster_name,
      List<String> entity_ids,
      List<double> cluster_vector});
}

/// @nodoc
class _$ClusterModelCopyWithImpl<$Res, $Val extends ClusterModel>
    implements $ClusterModelCopyWith<$Res> {
  _$ClusterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cluster_id = null,
    Object? cluster_name = null,
    Object? entity_ids = null,
    Object? cluster_vector = null,
  }) {
    return _then(_value.copyWith(
      cluster_id: null == cluster_id
          ? _value.cluster_id
          : cluster_id // ignore: cast_nullable_to_non_nullable
              as String,
      cluster_name: null == cluster_name
          ? _value.cluster_name
          : cluster_name // ignore: cast_nullable_to_non_nullable
              as String,
      entity_ids: null == entity_ids
          ? _value.entity_ids
          : entity_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cluster_vector: null == cluster_vector
          ? _value.cluster_vector
          : cluster_vector // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClusterModelCopyWith<$Res>
    implements $ClusterModelCopyWith<$Res> {
  factory _$$_ClusterModelCopyWith(
          _$_ClusterModel value, $Res Function(_$_ClusterModel) then) =
      __$$_ClusterModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cluster_id,
      String cluster_name,
      List<String> entity_ids,
      List<double> cluster_vector});
}

/// @nodoc
class __$$_ClusterModelCopyWithImpl<$Res>
    extends _$ClusterModelCopyWithImpl<$Res, _$_ClusterModel>
    implements _$$_ClusterModelCopyWith<$Res> {
  __$$_ClusterModelCopyWithImpl(
      _$_ClusterModel _value, $Res Function(_$_ClusterModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cluster_id = null,
    Object? cluster_name = null,
    Object? entity_ids = null,
    Object? cluster_vector = null,
  }) {
    return _then(_$_ClusterModel(
      cluster_id: null == cluster_id
          ? _value.cluster_id
          : cluster_id // ignore: cast_nullable_to_non_nullable
              as String,
      cluster_name: null == cluster_name
          ? _value.cluster_name
          : cluster_name // ignore: cast_nullable_to_non_nullable
              as String,
      entity_ids: null == entity_ids
          ? _value._entity_ids
          : entity_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cluster_vector: null == cluster_vector
          ? _value._cluster_vector
          : cluster_vector // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClusterModel implements _ClusterModel {
  _$_ClusterModel(
      {required this.cluster_id,
      required this.cluster_name,
      required final List<String> entity_ids,
      required final List<double> cluster_vector})
      : _entity_ids = entity_ids,
        _cluster_vector = cluster_vector;

  factory _$_ClusterModel.fromJson(Map<String, dynamic> json) =>
      _$$_ClusterModelFromJson(json);

  @override
  final String cluster_id;
  @override
  final String cluster_name;
  final List<String> _entity_ids;
  @override
  List<String> get entity_ids {
    if (_entity_ids is EqualUnmodifiableListView) return _entity_ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entity_ids);
  }

  final List<double> _cluster_vector;
  @override
  List<double> get cluster_vector {
    if (_cluster_vector is EqualUnmodifiableListView) return _cluster_vector;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cluster_vector);
  }

  @override
  String toString() {
    return 'ClusterModel(cluster_id: $cluster_id, cluster_name: $cluster_name, entity_ids: $entity_ids, cluster_vector: $cluster_vector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClusterModel &&
            (identical(other.cluster_id, cluster_id) ||
                other.cluster_id == cluster_id) &&
            (identical(other.cluster_name, cluster_name) ||
                other.cluster_name == cluster_name) &&
            const DeepCollectionEquality()
                .equals(other._entity_ids, _entity_ids) &&
            const DeepCollectionEquality()
                .equals(other._cluster_vector, _cluster_vector));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cluster_id,
      cluster_name,
      const DeepCollectionEquality().hash(_entity_ids),
      const DeepCollectionEquality().hash(_cluster_vector));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClusterModelCopyWith<_$_ClusterModel> get copyWith =>
      __$$_ClusterModelCopyWithImpl<_$_ClusterModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClusterModelToJson(
      this,
    );
  }
}

abstract class _ClusterModel implements ClusterModel {
  factory _ClusterModel(
      {required final String cluster_id,
      required final String cluster_name,
      required final List<String> entity_ids,
      required final List<double> cluster_vector}) = _$_ClusterModel;

  factory _ClusterModel.fromJson(Map<String, dynamic> json) =
      _$_ClusterModel.fromJson;

  @override
  String get cluster_id;
  @override
  String get cluster_name;
  @override
  List<String> get entity_ids;
  @override
  List<double> get cluster_vector;
  @override
  @JsonKey(ignore: true)
  _$$_ClusterModelCopyWith<_$_ClusterModel> get copyWith =>
      throw _privateConstructorUsedError;
}
