import 'package:eec_app/controllers/data_page/cluster_page/cluster_page_state.dart';
import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClusterPageController extends StateNotifier<ClusterPageState> {
  ClusterPageController({required this.ref})
      : super(ClusterPageState(
          clusterList:
              InstanceController().getByType<ClusterRepository>().clusters,
          isLoading: false,
          searchQuery: null,
          sortColumnIndex: null,
          isAscending: null,
          tablePage: 0,
          tableRowsPerPage: 10,
          selectedClusterIds: {},
        ));

  final ClusterRepository _clusterRepository =
      InstanceController().getByType<ClusterRepository>();

  final Ref ref;

  void fetchClusters() async {
    await _clusterRepository.refresh();
    state = state.copyWith(
      clusterList: _clusterRepository.clusters,
      isLoading: false,
    );
  }

  void search(String? value) {
    if (value?.isEmpty ?? true) {
      state = state.copyWith(
          searchQuery: null, clusterList: _clusterRepository.clusters);
      return;
    }

    final filteredList = _clusterRepository.clusters
        .where((e) => e.cluster_name.contains(value!))
        .toList();
    state = state.copyWith(searchQuery: value, clusterList: filteredList);
  }

  void deleteSelected() async {
    await _clusterRepository.deleteClusters(state.selectedClusterIds);
    state = state.copyWith(
        selectedClusterIds: {}, clusterList: _clusterRepository.clusters);
  }

  void selectAll() {
    state = state.copyWith(
        selectedClusterIds: state.clusterList.map((e) => e.cluster_id).toSet());
  }

  void deselectAll() {
    state = state.copyWith(selectedClusterIds: {});
  }

  void selectCluster(String clusterId) {
    state = state
        .copyWith(selectedClusterIds: {...state.selectedClusterIds, clusterId});
  }

  void deselectCluster(String clusterId) {
    final selectedClusterIds = {...state.selectedClusterIds};
    selectedClusterIds.remove(clusterId);
    state = state.copyWith(selectedClusterIds: selectedClusterIds);
  }

  void sortBy(bool ascending, int columnIndex,
      int Function(ClusterModel e1, ClusterModel e2) compare) {
    final sortedList = [...state.clusterList];
    sortedList.sort(compare);
    state = state.copyWith(
        isAscending: ascending,
        sortColumnIndex: columnIndex,
        clusterList: sortedList);
  }

  void deleteCluster(String clusterId) async {
    await _clusterRepository.deleteCluster(clusterId);
    state = state.copyWith(clusterList: _clusterRepository.clusters);
  }

  Future<bool> addCluster(clusterName) async {
    final result = await _clusterRepository.addCluster(clusterName);
    state = state.copyWith(clusterList: _clusterRepository.clusters);
    return result;
  }

  void setPageSize(int pageSize) {
    final currentFirstRowIndex = state.tablePage * state.tableRowsPerPage;
    final page = currentFirstRowIndex ~/ pageSize;
    state = state.copyWith(tableRowsPerPage: pageSize, tablePage: page);
  }

  void setPage(int page) {
    state = state.copyWith(tablePage: page);
  }
}
