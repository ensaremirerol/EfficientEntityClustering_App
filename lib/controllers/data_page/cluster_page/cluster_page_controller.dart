import 'dart:io';

import 'package:eec_app/controllers/data_page/cluster_page/cluster_page_state.dart';
import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

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

  final SnackBarService _snackBarService =
      InstanceController().getByType<SnackBarService>();

  final Ref ref;

  void fetchClusters() async {
    _snackBarService.showInfoMessage('Fetching clusters...');
    await _clusterRepository.refresh();
    state = state.copyWith(
      clusterList: _clusterRepository.clusters,
      isLoading: false,
    );
    _snackBarService.showSuccessMessage('Clusters fetched', clear: true);
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
    _snackBarService.showInfoMessage('Deleting cluster...');
    await _clusterRepository.deleteCluster(clusterId);
    state = state.copyWith(clusterList: _clusterRepository.clusters);
    _snackBarService.showSuccessMessage('Cluster with id $clusterId deleted',
        clear: true);
  }

  Future<bool> addCluster(clusterName) async {
    _snackBarService.showInfoMessage('Adding cluster...');
    final result = await _clusterRepository.addCluster(clusterName);
    state = state.copyWith(clusterList: _clusterRepository.clusters);
    _snackBarService.showSuccessMessage('Cluster added', clear: true);
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

  Future<void> exportAll() async {
    _snackBarService.showInfoMessage('Exporting clusters...');
    String data;
    try {
      data = await _clusterRepository.exportAll();
    } catch (e) {
      InstanceController()
          .getByType<SnackBarService>()
          .showErrorMessage(e.toString());
      rethrow;
    }

    String? path;
    if (Platform.isAndroid || Platform.isIOS || kIsWeb) {
      path = getDownloadsDirectory().toString() + '/clusters.csv';
    } else {
      path = await FilePicker.platform.saveFile(
          fileName: 'clusters.csv',
          dialogTitle: 'Export entities',
          lockParentWindow: true,
          type: FileType.custom,
          allowedExtensions: ['csv']);
    }

    if (path == null) {
      return;
    }

    File file = File(path);
    file = await file.create();
    file = await file.writeAsString(data);
    _snackBarService.showSuccessMessage('Clusters exported', clear: true);
  }
}
