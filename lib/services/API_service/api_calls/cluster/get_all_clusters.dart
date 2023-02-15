import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class GetAllClusters extends IAPICall {
  const GetAllClusters()
      : super(
            name: 'GetAllClusters',
            path: '/clusters',
            method: 'GET',
            requiresArgs: false);
}
