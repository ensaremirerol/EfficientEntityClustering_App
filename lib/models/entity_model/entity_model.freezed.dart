// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EntityModel _$EntityModelFromJson(Map<String, dynamic> json) {
  return _EntityModel.fromJson(json);
}

/// @nodoc
mixin _$EntityModel {
  String get entity_id => throw _privateConstructorUsedError;
  String get mention => throw _privateConstructorUsedError;
  String get entity_source => throw _privateConstructorUsedError;
  String get entity_source_id => throw _privateConstructorUsedError;
  bool get has_cluster => throw _privateConstructorUsedError;
  String get cluster_id => throw _privateConstructorUsedError;
  bool get has_mention_vector => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityModelCopyWith<EntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityModelCopyWith<$Res> {
  factory $EntityModelCopyWith(
          EntityModel value, $Res Function(EntityModel) then) =
      _$EntityModelCopyWithImpl<$Res, EntityModel>;
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id,
      bool has_cluster,
      String cluster_id,
      bool has_mention_vector});
}

/// @nodoc
class _$EntityModelCopyWithImpl<$Res, $Val extends EntityModel>
    implements $EntityModelCopyWith<$Res> {
  _$EntityModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity_id = null,
    Object? mention = null,
    Object? entity_source = null,
    Object? entity_source_id = null,
    Object? has_cluster = null,
    Object? cluster_id = null,
    Object? has_mention_vector = null,
  }) {
    return _then(_value.copyWith(
      entity_id: null == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as String,
      mention: null == mention
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as String,
      entity_source: null == entity_source
          ? _value.entity_source
          : entity_source // ignore: cast_nullable_to_non_nullable
              as String,
      entity_source_id: null == entity_source_id
          ? _value.entity_source_id
          : entity_source_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_cluster: null == has_cluster
          ? _value.has_cluster
          : has_cluster // ignore: cast_nullable_to_non_nullable
              as bool,
      cluster_id: null == cluster_id
          ? _value.cluster_id
          : cluster_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_mention_vector: null == has_mention_vector
          ? _value.has_mention_vector
          : has_mention_vector // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EntityModelCopyWith<$Res>
    implements $EntityModelCopyWith<$Res> {
  factory _$$_EntityModelCopyWith(
          _$_EntityModel value, $Res Function(_$_EntityModel) then) =
      __$$_EntityModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id,
      bool has_cluster,
      String cluster_id,
      bool has_mention_vector});
}

/// @nodoc
class __$$_EntityModelCopyWithImpl<$Res>
    extends _$EntityModelCopyWithImpl<$Res, _$_EntityModel>
    implements _$$_EntityModelCopyWith<$Res> {
  __$$_EntityModelCopyWithImpl(
      _$_EntityModel _value, $Res Function(_$_EntityModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity_id = null,
    Object? mention = null,
    Object? entity_source = null,
    Object? entity_source_id = null,
    Object? has_cluster = null,
    Object? cluster_id = null,
    Object? has_mention_vector = null,
  }) {
    return _then(_$_EntityModel(
      entity_id: null == entity_id
          ? _value.entity_id
          : entity_id // ignore: cast_nullable_to_non_nullable
              as String,
      mention: null == mention
          ? _value.mention
          : mention // ignore: cast_nullable_to_non_nullable
              as String,
      entity_source: null == entity_source
          ? _value.entity_source
          : entity_source // ignore: cast_nullable_to_non_nullable
              as String,
      entity_source_id: null == entity_source_id
          ? _value.entity_source_id
          : entity_source_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_cluster: null == has_cluster
          ? _value.has_cluster
          : has_cluster // ignore: cast_nullable_to_non_nullable
              as bool,
      cluster_id: null == cluster_id
          ? _value.cluster_id
          : cluster_id // ignore: cast_nullable_to_non_nullable
              as String,
      has_mention_vector: null == has_mention_vector
          ? _value.has_mention_vector
          : has_mention_vector // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityModel implements _EntityModel {
  _$_EntityModel(
      {required this.entity_id,
      required this.mention,
      required this.entity_source,
      required this.entity_source_id,
      required this.has_cluster,
      required this.cluster_id,
      required this.has_mention_vector});

  factory _$_EntityModel.fromJson(Map<String, dynamic> json) =>
      _$$_EntityModelFromJson(json);

  @override
  final String entity_id;
  @override
  final String mention;
  @override
  final String entity_source;
  @override
  final String entity_source_id;
  @override
  final bool has_cluster;
  @override
  final String cluster_id;
  @override
  final bool has_mention_vector;

  @override
  String toString() {
    return 'EntityModel(entity_id: $entity_id, mention: $mention, entity_source: $entity_source, entity_source_id: $entity_source_id, has_cluster: $has_cluster, cluster_id: $cluster_id, has_mention_vector: $has_mention_vector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityModel &&
            (identical(other.entity_id, entity_id) ||
                other.entity_id == entity_id) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.entity_source, entity_source) ||
                other.entity_source == entity_source) &&
            (identical(other.entity_source_id, entity_source_id) ||
                other.entity_source_id == entity_source_id) &&
            (identical(other.has_cluster, has_cluster) ||
                other.has_cluster == has_cluster) &&
            (identical(other.cluster_id, cluster_id) ||
                other.cluster_id == cluster_id) &&
            (identical(other.has_mention_vector, has_mention_vector) ||
                other.has_mention_vector == has_mention_vector));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      entity_id,
      mention,
      entity_source,
      entity_source_id,
      has_cluster,
      cluster_id,
      has_mention_vector);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntityModelCopyWith<_$_EntityModel> get copyWith =>
      __$$_EntityModelCopyWithImpl<_$_EntityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityModelToJson(
      this,
    );
  }
}

abstract class _EntityModel implements EntityModel {
  factory _EntityModel(
      {required final String entity_id,
      required final String mention,
      required final String entity_source,
      required final String entity_source_id,
      required final bool has_cluster,
      required final String cluster_id,
      required final bool has_mention_vector}) = _$_EntityModel;

  factory _EntityModel.fromJson(Map<String, dynamic> json) =
      _$_EntityModel.fromJson;

  @override
  String get entity_id;
  @override
  String get mention;
  @override
  String get entity_source;
  @override
  String get entity_source_id;
  @override
  bool get has_cluster;
  @override
  String get cluster_id;
  @override
  bool get has_mention_vector;
  @override
  @JsonKey(ignore: true)
  _$$_EntityModelCopyWith<_$_EntityModel> get copyWith =>
      throw _privateConstructorUsedError;
}
