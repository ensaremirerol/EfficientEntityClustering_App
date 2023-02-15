// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mention_clstering_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MentionClsteringModel _$$_MentionClsteringModelFromJson(
        Map<String, dynamic> json) =>
    _$_MentionClsteringModel(
      entity_id: json['entity_id'] as String,
      mention: json['mention'] as String,
      entity_source: json['entity_source'] as String,
      entity_source_id: json['entity_source_id'] as String,
      possible_cluster_ids: (json['possible_cluster_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      possible_cluster_names: (json['possible_cluster_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_MentionClsteringModelToJson(
        _$_MentionClsteringModel instance) =>
    <String, dynamic>{
      'entity_id': instance.entity_id,
      'mention': instance.mention,
      'entity_source': instance.entity_source,
      'entity_source_id': instance.entity_source_id,
      'possible_cluster_ids': instance.possible_cluster_ids,
      'possible_cluster_names': instance.possible_cluster_names,
    };
