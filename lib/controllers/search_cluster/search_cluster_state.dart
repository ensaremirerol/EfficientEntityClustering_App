
import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_cluster_state.freezed.dart';


@freezed
class SearchClusterState with _$SearchClusterState {
  factory SearchClusterState({
    required String? searchQuery,
    required List<ClusterModel> clusters,
    required bool isLoading,
  }) = _SearchClusterState;
	
}
