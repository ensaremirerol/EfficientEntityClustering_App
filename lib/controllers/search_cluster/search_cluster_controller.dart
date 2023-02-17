import 'package:eec_app/controllers/search_cluster/search_cluster_state.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchClusterController extends StateNotifier<SearchClusterState> {
  SearchClusterController()
      : super(SearchClusterState(
          searchQuery: null,
          clusters: [],
          isLoading: false,
        ));

  final _clusterRepository =
      InstanceController().getByType<ClusterRepository>();
  final _snackBarService = InstanceController().getByType<SnackBarService>();

  void search(String? query) {
    state = state.copyWith(searchQuery: query, isLoading: true);
    if (query?.isEmpty ?? true) {
      state = state.copyWith(clusters: [], isLoading: false);
      return;
    }

    final clusters = _clusterRepository.clusters
        .where((element) =>
            element.cluster_name.toLowerCase().contains(query!.toLowerCase()))
        .toList();

    state = state.copyWith(clusters: clusters, isLoading: false);
  }

  Future<void> clearCluster(String entityId, String clusterId) async {
    state = state.copyWith(isLoading: true);
    try {
      await _clusterRepository.removeEntityFromCluster(entityId, clusterId);
    } catch (e) {
      _snackBarService
          .showErrorMessage('Error while removing entity from cluster\n$e');
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> changeCluster(
      String entityId, String oldClusterId, String newClusterId) async {
    state = state.copyWith(isLoading: true);
    try {
      await _clusterRepository.removeEntityFromCluster(entityId, oldClusterId);
    } catch (e) {
      _snackBarService
          .showErrorMessage('Error while removing entity to cluster\n$e');
    }
    try {
      await _clusterRepository.addEntityToCluster(entityId, newClusterId);
    } catch (e) {
      _snackBarService
          .showErrorMessage('Error while adding entity from cluster\n$e');
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> addToCluster(String entityId, String cluster_id) async {
    state = state.copyWith(isLoading: true);
    try {
      await _clusterRepository.addEntityToCluster(entityId, cluster_id);
    } catch (e) {
      _snackBarService
          .showErrorMessage('Error while adding entity from cluster\n$e');
    }
    state = state.copyWith(isLoading: false);
  }
}
