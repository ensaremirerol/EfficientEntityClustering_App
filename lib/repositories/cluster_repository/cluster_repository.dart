import 'package:eec_app/models/cluster_model/cluster_model.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/create_cluster.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/delete_cluster.dart';
import 'package:eec_app/services/API_service/api_calls/cluster/get_all_clusters.dart';
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
        InstanceController().getByType<SnackBarService>().showErrorMessage(
            'Error while fetching clusters:\n${response.data['detail']}');
        throw Exception('Response data is null');
      }
    } on Exception catch (e) {
      _logger.e('Error while refreshing ClusterRepository');
      _logger.e(e);
    }
  }

  Future<void> deleteCluster(String clusterId)async {
    _logger.i('Deleting cluster');
    try {
      final response = await apiService.call(const DeleteCluster(), DeleteClusterArgs(id: clusterId));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _clusters.removeWhere((element) => element.cluster_id == clusterId);
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        InstanceController().getByType<SnackBarService>().showErrorMessage(
            'Error while deleting entity with id ${clusterId}:\n${response.data['detail']}');
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while deleting cluster');
      _logger.e(e);
    }
  }

  Future<void> deleteClusters(Set<String> selectedClusterIds) async {
    _logger.i('Deleting clusters');
    await Future.forEach(selectedClusterIds, (element) => deleteCluster(element));
  }

  Future<bool> addCluster(String clusterName)async{
    _logger.i('Adding cluster');
    try {
      final response = await apiService.call(const CreateCluster(), CreateClusterArgs(clusterName: clusterName));
      if ((response.statusCode ?? 0) ~/ 100 == 2) {
        _clusters.add(ClusterModel.fromJson(response.data));
        return true;
      } else {
        _logger.e('Response status code is not 200');
        _logger.e(response);
        InstanceController().getByType<SnackBarService>().showErrorMessage(
            'Error while adding cluster:\n${response.data['detail']}');
        throw Exception('Response status code is not 200');
      }
    } on Exception catch (e) {
      _logger.e('Error while adding cluster');
      _logger.e(e);
      return false;
    }
  }
}
