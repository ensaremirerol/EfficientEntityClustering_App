import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class UpdatePassword extends IAPICall {
  const UpdatePassword()
      : super(
            name: 'UpdatePassword',
            path: '/users/user/{id}/update/password',
            method: 'PUT',
            requiresArgs: true);
}

class UpdatePasswordArgs extends IAPICallArgs {
  final String oldPassword;
  final String newPassword;
  final String id;

  const UpdatePasswordArgs(
      {super.name = 'UpdatePassword',
      required this.id,
      required this.oldPassword,
      required this.newPassword});

  @override
  Map<String, dynamic> getData() {
    return {
      'old_password': oldPassword,
      'password': newPassword,
    };
  }

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
