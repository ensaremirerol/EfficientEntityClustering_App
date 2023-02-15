import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class CreateCluster extends IAPICall {
  const CreateCluster()
      : super(
            name: 'CreateCluster',
            path: '/clusters/cluster/create',
            method: 'POST',
            requiresArgs: true);
}

class CreateClusterArgs extends IAPICallArgs {
  final String clusterName;

  CreateClusterArgs({super.name = 'CreateCluster', required this.clusterName});

  @override
  Map<String, dynamic> getData() {
    return {"cluster_id": "0", "cluster_name": clusterName};
  }
}
