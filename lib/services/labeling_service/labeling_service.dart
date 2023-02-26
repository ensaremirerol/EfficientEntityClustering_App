import 'package:eec_app/models/mention_clustering_model/mention_clstering_model.dart';
import 'package:eec_app/services/API_service/api_calls/mention_clusterer/get_possible_clusters_for_next_entity.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';

class LabelingService {
  final APIService apiService = InstanceController().getByType<APIService>();

  Future<MentionClsteringModel> getNewEntity() async {
    final response =
        await apiService.call(const GetPossibleClustersForNextEntity(), null);
    if ((response.statusCode ?? 0) ~/ 100 == 2 && response.data != null) {
      return MentionClsteringModel.fromJson(response.data);
    } else {
      InstanceController().getByType<SnackBarService>().showErrorMessage(
          'Error while fetching clusters:\n${response.data['detail']}');
      throw Exception('Response data is null');
    }
  }
}
