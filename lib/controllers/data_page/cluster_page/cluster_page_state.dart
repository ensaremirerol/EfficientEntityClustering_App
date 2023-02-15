import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cluster_page_state.freezed.dart';

@freezed
class ClusterPageState with _$ClusterPageState {
  factory ClusterPageState({
    required List<ClusterModel> clusterList,
    required Set<String> selectedClusterIds,
    required int tablePage,
    required int tableRowsPerPage,
    required String? searchQuery,
    required int? sortColumnIndex,
    required bool? isAscending,
    required bool isLoading,
  }) = _ClusterPageState;
}
