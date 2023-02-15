
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_model.freezed.dart';
part 'cluster_model.g.dart';

/*
  ClusterModel Schema
  class ClusterOut(BaseModel):
    cluster_id: str
    cluster_name: str
    entity_ids: list[str]
    cluster_vector: list[float]


*/

@freezed
class ClusterModel with _$ClusterModel {
  factory ClusterModel({
    required String cluster_id,
    required String cluster_name,
    required List<String> entity_ids,
    required List<double> cluster_vector,
  }) = _ClusterModel;
	
  factory ClusterModel.fromJson(Map<String, dynamic> json) =>
			_$ClusterModelFromJson(json);
}
