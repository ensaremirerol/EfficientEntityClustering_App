import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class DeleteClusters extends IAPICall {
  const DeleteClusters()
      : super(
            name: 'DeleteClusters',
            path: '/clusters/delete',
            method: 'DELETE',
            requiresArgs: true);
}

class DeleteClustersArgs extends IAPICallArgs {
  final List<String> ids;

  const DeleteClustersArgs({super.name = 'DeleteClusters', required this.ids});

  @override
  Map<String, dynamic> getData() {
    return {'cluster_ids': ids};
  }
}
