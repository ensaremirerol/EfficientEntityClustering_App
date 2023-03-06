import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class DeleteUser extends IAPICall {
  const DeleteUser()
      : super(
            name: 'DeleteUser',
            path: '/users/user/{id}/delete',
            method: 'DELETE',
            requiresArgs: true);
}

class DeleteUserArgs extends IAPICallArgs {
  final String id;

  const DeleteUserArgs({super.name = 'DeleteUser', required this.id});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
