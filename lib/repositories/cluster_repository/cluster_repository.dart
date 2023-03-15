import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/add_entity_to_cluster.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/create_cluster.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/delete_cluster.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/delete_clusters.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/export_all_clusters.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/get_all_clusters.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/remove_entity_from_cluster.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class ClusterRepository {
  final APIService apiService = InstanceController().getByType<APIService>();

  final List<ClusterModel> _clusters = [];

  List<ClusterModel> get clusters => [..._clusters];

  final Logger _logger = Logger();

  Future<void> refresh() async {
    _logger.i('Refreshing ClusterRepository');
    try {
      final response = await apiService.call(const GetAllClusters(), null);
      if (response.data != null) {
        _clusters.clear();
        _clusters.addAll(
            (response.data as List).map((e) => ClusterModel.fromJson(e)));
      } else {
        _logger.e('Response data is null');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while refreshing ClusterRepository:\n${response.data['detail']}');
        } else {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while refreshing ClusterRepository:\n${response.data}');
        }
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while refreshing ClusterRepository');
      _logger.e(e);
    }
  }

  Future<void> deleteCluster(String clusterId) async {
    _logger.i('Deleting cluster');
    try {
      final response = await apiService.call(
          const DeleteCluster(), DeleteClusterArgs(id: clusterId));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _clusters.removeWhere((element) => element.cluster_id == clusterId);
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entity with id ${clusterId}:\n${response.data['detail']}');
        } else {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entity with id ${clusterId}');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while deleting cluster');
      _logger.e(e);
    }
  }

  Future<void> deleteClusters(Set<String> selectedClusterIds) async {
    _logger.i('Deleting clusters');
    try {
      final response = await apiService.call(const DeleteClusters(),
          DeleteClustersArgs(ids: selectedClusterIds.toList(growable: false)));

      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _clusters.removeWhere(
            (element) => selectedClusterIds.contains(element.cluster_id));
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while deleting entities:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while deleting entities');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while deleting clusters');
      _logger.e(e);
    }
  }

  Future<bool> addCluster(String clusterName) async {
    _logger.i('Adding cluster');
    try {
      final response = await apiService.call(
          const CreateCluster(), CreateClusterArgs(clusterName: clusterName));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _clusters.add(ClusterModel.fromJson(response.data));
        return true;
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while adding cluster:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while adding cluster');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while adding cluster');
      _logger.e(e);
      return false;
    }
  }

  Future<String> exportAll() async {
    try {
      final response = await apiService.call(const ExportAllClusters(), null);
      if (response.statusCode == 200) {
        return response.data!;
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while exporting entities:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while exporting entities');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while exporting entities');
      _logger.e(e);
      rethrow;
    }
  }

  Future addEntityToCluster(String entityId, String clusterId) async {
    try {
      final response = await apiService.call(const AddEntityToCluster(),
          AddEntityToClusterArgs(id: clusterId, entityId: entityId));
      if ((response.statusCode ?? 0) == 200) {
        final cluster = ClusterModel.fromJson(response.data!);
        _clusters.removeWhere((element) => element.cluster_id == clusterId);
        _clusters.add(cluster);
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while adding entity to cluster:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while adding entity to cluster');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while adding entity to cluster');
      _logger.e(e);
      rethrow;
    }
  }

  Future removeEntityFromCluster(String entityId, String clusterId) async {
    try {
      final response = await apiService.call(const RemoveEntityFromCluster(),
          RemoveEntityFromClusterArgs(id: clusterId, entityId: entityId));
      if ((response.statusCode ?? 0) == 200) {
        final cluster = ClusterModel.fromJson(response.data!);
        _clusters.removeWhere((element) => element.cluster_id == clusterId);
        _clusters.add(cluster);
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        if (response.data != null) {
          InstanceController().getByType<SnackBarService>().showErrorMessage(
              'Error while removing entity from cluster:\n${response.data['detail']}');
        } else {
          InstanceController()
              .getByType<SnackBarService>()
              .showErrorMessage('Error while removing entity from cluster');
        }
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while removing entity from cluster');
      _logger.e(e);
      rethrow;
    }
  }

  void dispose() {
    _clusters.clear();
  }
}
