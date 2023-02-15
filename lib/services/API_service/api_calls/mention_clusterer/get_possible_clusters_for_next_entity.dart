import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class GetPossibleClustersForNextEntity extends IAPICall {
  const GetPossibleClustersForNextEntity()
      : super(
            name: 'GetPossibleClustersForNextEntity',
            path: '/mention_clustering/',
            method: 'GET',
            requiresArgs: false);
}
