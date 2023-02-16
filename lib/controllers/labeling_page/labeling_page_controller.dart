import 'package:eec_app/controllers/labeling_page/labeling_page_state.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/services/labeling_service/labeling_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LabelingPageController extends StateNotifier<LabelingPageState> {
  LabelingPageController(
    this.ref,
  ) : super(LabelingPageState(
          currentEntityId: null,
          currentEntityMention: null,
          possibleClusterNames: null,
          possibleClusterIds: null,
          isLoading: false,
          searchQuery: null,
          clusterSearchResults: [],
        ));

  Ref ref;
  final SnackBarService _snackBarService =
      InstanceController().getByType<SnackBarService>();
  final LabelingService _labelingService =
      InstanceController().getByType<LabelingService>();

  final ClusterRepository _clusterRepository =
      InstanceController().getByType<ClusterRepository>();

  void getNewEntity() async {
    state = state.copyWith(
      isLoading: true,
    );
    final data = await _labelingService.getNewEntity();

    state = state.copyWith(
      currentEntityId: data.entity_id,
      currentEntityMention: data.mention,
      possibleClusterNames: data.possible_cluster_names,
      possibleClusterIds: data.possible_cluster_ids,
      isLoading: false,
      searchQuery: null,
      clusterSearchResults: [],
    );
  }

  void searchClusters(String? query) async {
    state = state.copyWith(
      isLoading: true,
    );
    if (query?.isEmpty ?? true) {
      state = state.copyWith(
        clusterSearchResults: [],
        searchQuery: query,
        isLoading: false,
      );
      return;
    }

    final clusters = await _clusterRepository.clusters;
    final results = clusters
        .where((element) =>
            element.cluster_name.toLowerCase().contains(query!.toLowerCase()))
        .toList();

    state = state.copyWith(
      clusterSearchResults: results,
      searchQuery: query,
      isLoading: false,
    );
  }

  void createCluster(String name) async {
    _snackBarService.showInfoMessage(
      'Creating cluster...',
    );
    state = state.copyWith(
      isLoading: true,
    );
    await _clusterRepository.addCluster(name);
    searchClusters(name);
    _snackBarService.showSuccessMessage(
      'Cluster created!',
      clear: true,
    );
  }

  void addToCluster(String clusterId) async {
    _snackBarService.showInfoMessage(
      'Adding to cluster...',
    );
    state = state.copyWith(
      isLoading: true,
    );
    await _clusterRepository.addEntityToCluster(
      state.currentEntityId!,
      clusterId,
    );
    _snackBarService.showSuccessMessage(
      'Added to cluster!',
      clear: true,
    );
    getNewEntity();
  }
}
