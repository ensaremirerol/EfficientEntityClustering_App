// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ClusterModel _$$_ClusterModelFromJson(Map<String, dynamic> json) =>
    _$_ClusterModel(
      cluster_id: json['cluster_id'] as String,
      cluster_name: json['cluster_name'] as String,
      entity_ids: (json['entity_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      cluster_vector: (json['cluster_vector'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$_ClusterModelToJson(_$_ClusterModel instance) =>
    <String, dynamic>{
      'cluster_id': instance.cluster_id,
      'cluster_name': instance.cluster_name,
      'entity_ids': instance.entity_ids,
      'cluster_vector': instance.cluster_vector,
    };
