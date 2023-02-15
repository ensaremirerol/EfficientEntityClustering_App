// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mention_clstering_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MentionClsteringModel _$MentionClsteringModelFromJson(
    Map<String, dynamic> json) {
  return _MentionClsteringModel.fromJson(json);
}

/// @nodoc
mixin _$MentionClsteringModel {
  String get entity_id => throw _privateConstructorUsedError;
  String get mention => throw _privateConstructorUsedError;
  String get entity_source => throw _privateConstructorUsedError;
  String get entity_source_id => throw _privateConstructorUsedError;
  List<String> get possible_cluster_ids => throw _privateConstructorUsedError;
  List<String> get possible_cluster_names => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MentionClsteringModelCopyWith<MentionClsteringModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentionClsteringModelCopyWith<$Res> {
  factory $MentionClsteringModelCopyWith(MentionClsteringModel value,
          $Res Function(MentionClsteringModel) then) =
      _$MentionClsteringModelCopyWithImpl<$Res, MentionClsteringModel>;
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id,
      List<String> possible_cluster_ids,
      List<String> possible_cluster_names});
}

/// @nodoc
class _$MentionClsteringModelCopyWithImpl<$Res,
        $Val extends MentionClsteringModel>
    implements $MentionClsteringModelCopyWith<$Res> {
  _$MentionClsteringModelCopyWithImpl(this._value, this._then);

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
    Object? possible_cluster_ids = null,
    Object? possible_cluster_names = null,
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
      possible_cluster_ids: null == possible_cluster_ids
          ? _value.possible_cluster_ids
          : possible_cluster_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possible_cluster_names: null == possible_cluster_names
          ? _value.possible_cluster_names
          : possible_cluster_names // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MentionClsteringModelCopyWith<$Res>
    implements $MentionClsteringModelCopyWith<$Res> {
  factory _$$_MentionClsteringModelCopyWith(_$_MentionClsteringModel value,
          $Res Function(_$_MentionClsteringModel) then) =
      __$$_MentionClsteringModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id,
      List<String> possible_cluster_ids,
      List<String> possible_cluster_names});
}

/// @nodoc
class __$$_MentionClsteringModelCopyWithImpl<$Res>
    extends _$MentionClsteringModelCopyWithImpl<$Res, _$_MentionClsteringModel>
    implements _$$_MentionClsteringModelCopyWith<$Res> {
  __$$_MentionClsteringModelCopyWithImpl(_$_MentionClsteringModel _value,
      $Res Function(_$_MentionClsteringModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity_id = null,
    Object? mention = null,
    Object? entity_source = null,
    Object? entity_source_id = null,
    Object? possible_cluster_ids = null,
    Object? possible_cluster_names = null,
  }) {
    return _then(_$_MentionClsteringModel(
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
      possible_cluster_ids: null == possible_cluster_ids
          ? _value._possible_cluster_ids
          : possible_cluster_ids // ignore: cast_nullable_to_non_nullable
              as List<String>,
      possible_cluster_names: null == possible_cluster_names
          ? _value._possible_cluster_names
          : possible_cluster_names // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MentionClsteringModel implements _MentionClsteringModel {
  _$_MentionClsteringModel(
      {required this.entity_id,
      required this.mention,
      required this.entity_source,
      required this.entity_source_id,
      required final List<String> possible_cluster_ids,
      required final List<String> possible_cluster_names})
      : _possible_cluster_ids = possible_cluster_ids,
        _possible_cluster_names = possible_cluster_names;

  factory _$_MentionClsteringModel.fromJson(Map<String, dynamic> json) =>
      _$$_MentionClsteringModelFromJson(json);

  @override
  final String entity_id;
  @override
  final String mention;
  @override
  final String entity_source;
  @override
  final String entity_source_id;
  final List<String> _possible_cluster_ids;
  @override
  List<String> get possible_cluster_ids {
    if (_possible_cluster_ids is EqualUnmodifiableListView)
      return _possible_cluster_ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possible_cluster_ids);
  }

  final List<String> _possible_cluster_names;
  @override
  List<String> get possible_cluster_names {
    if (_possible_cluster_names is EqualUnmodifiableListView)
      return _possible_cluster_names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_possible_cluster_names);
  }

  @override
  String toString() {
    return 'MentionClsteringModel(entity_id: $entity_id, mention: $mention, entity_source: $entity_source, entity_source_id: $entity_source_id, possible_cluster_ids: $possible_cluster_ids, possible_cluster_names: $possible_cluster_names)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MentionClsteringModel &&
            (identical(other.entity_id, entity_id) ||
                other.entity_id == entity_id) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.entity_source, entity_source) ||
                other.entity_source == entity_source) &&
            (identical(other.entity_source_id, entity_source_id) ||
                other.entity_source_id == entity_source_id) &&
            const DeepCollectionEquality()
                .equals(other._possible_cluster_ids, _possible_cluster_ids) &&
            const DeepCollectionEquality().equals(
                other._possible_cluster_names, _possible_cluster_names));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      entity_id,
      mention,
      entity_source,
      entity_source_id,
      const DeepCollectionEquality().hash(_possible_cluster_ids),
      const DeepCollectionEquality().hash(_possible_cluster_names));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MentionClsteringModelCopyWith<_$_MentionClsteringModel> get copyWith =>
      __$$_MentionClsteringModelCopyWithImpl<_$_MentionClsteringModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MentionClsteringModelToJson(
      this,
    );
  }
}

abstract class _MentionClsteringModel implements MentionClsteringModel {
  factory _MentionClsteringModel(
          {required final String entity_id,
          required final String mention,
          required final String entity_source,
          required final String entity_source_id,
          required final List<String> possible_cluster_ids,
          required final List<String> possible_cluster_names}) =
      _$_MentionClsteringModel;

  factory _MentionClsteringModel.fromJson(Map<String, dynamic> json) =
      _$_MentionClsteringModel.fromJson;

  @override
  String get entity_id;
  @override
  String get mention;
  @override
  String get entity_source;
  @override
  String get entity_source_id;
  @override
  List<String> get possible_cluster_ids;
  @override
  List<String> get possible_cluster_names;
  @override
  @JsonKey(ignore: true)
  _$$_MentionClsteringModelCopyWith<_$_MentionClsteringModel> get copyWith =>
      throw _privateConstructorUsedError;
}
