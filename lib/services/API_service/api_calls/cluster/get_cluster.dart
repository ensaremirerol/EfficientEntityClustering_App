import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class GetCluster extends IAPICall {
  const GetCluster()
      : super(
            name: 'GetCluster',
            path: '/clusters/cluster/{id}',
            method: 'GET',
            requiresArgs: true);
}

class GetClusterArgs extends IAPICallArgs {
  final String id;

  const GetClusterArgs({super.name = 'GetCluster', required this.id});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
