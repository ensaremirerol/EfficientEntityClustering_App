import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class UpdateUsername extends IAPICall {
  const UpdateUsername()
      : super(
            name: 'UpdateUsername',
            path: '/users/user/{id}/update/username',
            method: 'PUT',
            requiresArgs: true);
}

class UpdateUsernameArgs extends IAPICallArgs {
  final String newUsername;
  final String id;
  final String password;

  const UpdateUsernameArgs(
      {super.name = 'UpdateUsername',
      required this.id,
      required this.newUsername,
      required this.password});

  @override
  Map<String, dynamic> getData() {
    return {
      'username': newUsername,
      'password': password,
    };
  }

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
