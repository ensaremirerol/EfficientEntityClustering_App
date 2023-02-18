import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class RemoveEntityFromCluster extends IAPICall {
  const RemoveEntityFromCluster()
      : super(
            name: 'RemoveEntityFromCluster',
            path: '/clusters/cluster/{id}/remove-entity',
            method: 'POST',
            requiresArgs: true);
}

class RemoveEntityFromClusterArgs extends IAPICallArgs {
  final String id;
  final String entityId;

  const RemoveEntityFromClusterArgs(
      {super.name = 'RemoveEntityFromCluster',
      required this.id,
      required this.entityId});

  @override
  Map<String, dynamic> getQuery() {
    return {'entity_id': entityId};
  }

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
