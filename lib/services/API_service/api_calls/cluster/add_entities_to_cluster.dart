import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class AddEntitiesToCluster extends IAPICall{
  const AddEntitiesToCluster()
      : super(
            name: 'AddEntitiesToCluster',
            path: '/clusters/cluster/{id}/add_entities',
            method: 'POST',
            requiresArgs: true);
}

class AddEntitiesToClusterArgs extends IAPICallArgs{
  final String id;
  final List<String> entityIds;

  const AddEntitiesToClusterArgs({super.name = 'AddEntitiesToCluster', required this.id, required this.entityIds});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }

  @override
  Map<String, dynamic> getData() {
    return {
      'entity_ids': entityIds,
    };
  }
}