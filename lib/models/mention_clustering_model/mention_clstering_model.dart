import 'package:freezed_annotation/freezed_annotation.dart';

part 'mention_clstering_model.freezed.dart';
part 'mention_clstering_model.g.dart';

/*

  MentionClsteringModel Schema
  class MentionOut(BaseModel):
    entity_id: str
    mention: str
    entity_source: str
    entity_source_id: str
    possible_cluster_ids: list[str]
    possible_cluster_names: list[str]
  
*/

@freezed
class MentionClsteringModel with _$MentionClsteringModel {
  factory MentionClsteringModel(
      {required String entity_id,
      required String mention,
      required String entity_source,
      required String entity_source_id,
      required List<String> possible_cluster_ids,
      required List<String> possible_cluster_names}) = _MentionClsteringModel;

  factory MentionClsteringModel.fromJson(Map<String, dynamic> json) =>
      _$MentionClsteringModelFromJson(json);
}
