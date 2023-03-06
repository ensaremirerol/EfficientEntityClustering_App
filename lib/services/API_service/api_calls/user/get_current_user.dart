import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class GetCurrentUser extends IAPICall {
  const GetCurrentUser()
      : super(
            name: 'GetCurrentUser',
            path: '/users/me',
            method: 'GET',
            requiresArgs: false);
}
