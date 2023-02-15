// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_entity_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiEntityIn _$ApiEntityInFromJson(Map<String, dynamic> json) {
  return _ApiEntityIn.fromJson(json);
}

/// @nodoc
mixin _$ApiEntityIn {
  String get entity_id => throw _privateConstructorUsedError;
  String get mention => throw _privateConstructorUsedError;
  String get entity_source => throw _privateConstructorUsedError;
  String get entity_source_id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiEntityInCopyWith<ApiEntityIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiEntityInCopyWith<$Res> {
  factory $ApiEntityInCopyWith(
          ApiEntityIn value, $Res Function(ApiEntityIn) then) =
      _$ApiEntityInCopyWithImpl<$Res, ApiEntityIn>;
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id});
}

/// @nodoc
class _$ApiEntityInCopyWithImpl<$Res, $Val extends ApiEntityIn>
    implements $ApiEntityInCopyWith<$Res> {
  _$ApiEntityInCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiEntityInCopyWith<$Res>
    implements $ApiEntityInCopyWith<$Res> {
  factory _$$_ApiEntityInCopyWith(
          _$_ApiEntityIn value, $Res Function(_$_ApiEntityIn) then) =
      __$$_ApiEntityInCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String entity_id,
      String mention,
      String entity_source,
      String entity_source_id});
}

/// @nodoc
class __$$_ApiEntityInCopyWithImpl<$Res>
    extends _$ApiEntityInCopyWithImpl<$Res, _$_ApiEntityIn>
    implements _$$_ApiEntityInCopyWith<$Res> {
  __$$_ApiEntityInCopyWithImpl(
      _$_ApiEntityIn _value, $Res Function(_$_ApiEntityIn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entity_id = null,
    Object? mention = null,
    Object? entity_source = null,
    Object? entity_source_id = null,
  }) {
    return _then(_$_ApiEntityIn(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiEntityIn implements _ApiEntityIn {
  _$_ApiEntityIn(
      {required this.entity_id,
      required this.mention,
      required this.entity_source,
      required this.entity_source_id});

  factory _$_ApiEntityIn.fromJson(Map<String, dynamic> json) =>
      _$$_ApiEntityInFromJson(json);

  @override
  final String entity_id;
  @override
  final String mention;
  @override
  final String entity_source;
  @override
  final String entity_source_id;

  @override
  String toString() {
    return 'ApiEntityIn(entity_id: $entity_id, mention: $mention, entity_source: $entity_source, entity_source_id: $entity_source_id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiEntityIn &&
            (identical(other.entity_id, entity_id) ||
                other.entity_id == entity_id) &&
            (identical(other.mention, mention) || other.mention == mention) &&
            (identical(other.entity_source, entity_source) ||
                other.entity_source == entity_source) &&
            (identical(other.entity_source_id, entity_source_id) ||
                other.entity_source_id == entity_source_id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, entity_id, mention, entity_source, entity_source_id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiEntityInCopyWith<_$_ApiEntityIn> get copyWith =>
      __$$_ApiEntityInCopyWithImpl<_$_ApiEntityIn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiEntityInToJson(
      this,
    );
  }
}

abstract class _ApiEntityIn implements ApiEntityIn {
  factory _ApiEntityIn(
      {required final String entity_id,
      required final String mention,
      required final String entity_source,
      required final String entity_source_id}) = _$_ApiEntityIn;

  factory _ApiEntityIn.fromJson(Map<String, dynamic> json) =
      _$_ApiEntityIn.fromJson;

  @override
  String get entity_id;
  @override
  String get mention;
  @override
  String get entity_source;
  @override
  String get entity_source_id;
  @override
  @JsonKey(ignore: true)
  _$$_ApiEntityInCopyWith<_$_ApiEntityIn> get copyWith =>
      throw _privateConstructorUsedError;
}
