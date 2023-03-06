import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class GetAllUsers extends IAPICall {
  const GetAllUsers()
      : super(
            name: 'GetAllUsers',
            path: '/users',
            method: 'GET',
            requiresArgs: false);
}
