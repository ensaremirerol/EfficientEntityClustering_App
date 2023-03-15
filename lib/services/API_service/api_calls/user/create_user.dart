import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class CreateUser extends IAPICall {
  const CreateUser()
      : super(
            name: 'CreateUser',
            path: '/users/user/create',
            method: 'POST',
            requiresArgs: true);
}

class CreateUserArgs extends IAPICallArgs {
  final String username;
  final String password;
  final List<String> scopes;

  const CreateUserArgs(
      {super.name = 'CreateUser',
      required this.username,
      required this.password,
      required this.scopes});

  @override
  @override
  Map<String, dynamic> getData() {
    return {
      'username': username,
      'password': password,
      'scopes': scopes,
    };
  }
}
