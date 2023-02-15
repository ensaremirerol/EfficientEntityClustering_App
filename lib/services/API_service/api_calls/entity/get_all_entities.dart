import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class GetAllEntities extends IAPICall {
  const GetAllEntities()
      : super(
            name: 'GetAllEntities',
            path: '/entities',
            method: 'GET',
            requiresArgs: false);
}
