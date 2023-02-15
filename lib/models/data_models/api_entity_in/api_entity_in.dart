import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_entity_in.freezed.dart';
part 'api_entity_in.g.dart';

/*

  class EntityIn(BaseModel):
    entity_id: str
    mention: str
    entity_source: str
    entity_source_id: str

*/

@freezed
class ApiEntityIn with _$ApiEntityIn {
  factory ApiEntityIn({
    required String entity_id,
    required String mention,
    required String entity_source,
    required String entity_source_id,
  }) = _ApiEntityIn;

  factory ApiEntityIn.fromJson(Map<String, dynamic> json) =>
      _$ApiEntityInFromJson(json);
}
