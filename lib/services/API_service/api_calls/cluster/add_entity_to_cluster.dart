import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class AddEntityToCluster extends IAPICall {
  const AddEntityToCluster()
      : super(
            name: 'AddEntityToCluster',
            path: '/clusters/cluster/{id}/add-entity',
            method: 'POST',
            requiresArgs: true);
}

class AddEntityToClusterArgs extends IAPICallArgs {
  final String id;
  final String entityId;

  const AddEntityToClusterArgs(
      {super.name = 'AddEntityToCluster',
      required this.id,
      required this.entityId});

  @override
  Map<String, dynamic> getQuery() {
    return {"entity_id": entityId};
  }

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
