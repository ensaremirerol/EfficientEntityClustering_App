// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntityModel _$$_EntityModelFromJson(Map<String, dynamic> json) =>
    _$_EntityModel(
      entity_id: json['entity_id'] as String,
      mention: json['mention'] as String,
      entity_source: json['entity_source'] as String,
      entity_source_id: json['entity_source_id'] as String,
      in_cluster: json['in_cluster'] as bool,
      cluster_id: json['cluster_id'] as String,
      has_mention_vector: json['has_mention_vector'] as bool,
    );

Map<String, dynamic> _$$_EntityModelToJson(_$_EntityModel instance) =>
    <String, dynamic>{
      'entity_id': instance.entity_id,
      'mention': instance.mention,
      'entity_source': instance.entity_source,
      'entity_source_id': instance.entity_source_id,
      'in_cluster': instance.in_cluster,
      'cluster_id': instance.cluster_id,
      'has_mention_vector': instance.has_mention_vector,
    };
