import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:eec_app/models/entity_model/entity_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'labeling_page_state.freezed.dart';

@freezed
class LabelingPageState with _$LabelingPageState {
  factory LabelingPageState({
    required String? currentEntityId,
    required String? currentEntityMention,
    required List<String>? possibleClusterNames,
    required List<String>? possibleClusterIds,
    required bool isLoading,
    required String? searchQuery,
    required List<ClusterModel> clusterSearchResults,
  }) = _LabelingPageState;
}
