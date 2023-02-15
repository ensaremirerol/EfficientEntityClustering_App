import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class DeleteCluster extends IAPICall {
  const DeleteCluster()
      : super(
            name: 'DeleteCluster',
            path: '/clusters/cluster/{id}',
            method: 'DELETE',
            requiresArgs: true);
}

class DeleteClusterArgs extends IAPICallArgs {
  final String id;

  const DeleteClusterArgs({super.name = 'DeleteCluster', required this.id});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
