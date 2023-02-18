import 'package:easy_localization/easy_localization.dart';
import 'package:eec_app/controllers/dashboard/dashboard_state.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/repositories/entity_repository/entity_repository.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardController extends StateNotifier<DashboardState> {
  DashboardController()
      : super(DashboardState(
          totalClusters: InstanceController()
              .getByType<ClusterRepository>()
              .clusters
              .length,
          totalLabledEnities: InstanceController()
              .getByType<EntityRepository>()
              .entities
              .where((element) => element.in_cluster)
              .length,
          totalEnities: InstanceController()
              .getByType<EntityRepository>()
              .entities
              .where((element) => !element.in_cluster)
              .length,
        ));

  final _clusterRepository =
      InstanceController().getByType<ClusterRepository>();
  final _entityRepository = InstanceController().getByType<EntityRepository>();
  final _snackbarService = InstanceController().getByType<SnackBarService>();

  void refreshValues() async {
    _snackbarService.showInfoMessage('refreshing_data'.tr());

    await _clusterRepository.refresh();
    await _entityRepository.refresh();

    state = DashboardState(
      totalClusters: _clusterRepository.clusters.length,
      totalLabledEnities: _entityRepository.entities
          .where((element) => element.in_cluster)
          .length,
      totalEnities: _entityRepository.entities
          .where((element) => !element.in_cluster)
          .length,
    );

    _snackbarService.showSuccessMessage('refreshing_data_success'.tr(),
        clear: true);
  }
}
