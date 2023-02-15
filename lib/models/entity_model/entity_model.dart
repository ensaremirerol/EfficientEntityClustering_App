
import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity_model.freezed.dart';
part 'entity_model.g.dart';


/*
  EntityModel Schema
  class EntityOut(BaseModel):
    entity_id: str
    mention: str
    entity_source: str
    entity_source_id: str
    in_cluster: bool
    cluster_id: str
    has_mention_vector: bool


*/

@freezed
class EntityModel with _$EntityModel {
  factory EntityModel({
    required String entity_id,
    required String mention,
    required String entity_source,
    required String entity_source_id,
    required bool in_cluster,
    required String cluster_id,
    required bool has_mention_vector,
  }) = _EntityModel;
	
  factory EntityModel.fromJson(Map<String, dynamic> json) =>
			_$EntityModelFromJson(json);
}
