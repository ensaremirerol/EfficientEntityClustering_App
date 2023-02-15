// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_entity_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiEntityIn _$$_ApiEntityInFromJson(Map<String, dynamic> json) =>
    _$_ApiEntityIn(
      entity_id: json['entity_id'] as String,
      mention: json['mention'] as String,
      entity_source: json['entity_source'] as String,
      entity_source_id: json['entity_source_id'] as String,
    );

Map<String, dynamic> _$$_ApiEntityInToJson(_$_ApiEntityIn instance) =>
    <String, dynamic>{
      'entity_id': instance.entity_id,
      'mention': instance.mention,
      'entity_source': instance.entity_source,
      'entity_source_id': instance.entity_source_id,
    };
