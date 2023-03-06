import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class UpdateScopes extends IAPICall {
  const UpdateScopes()
      : super(
            name: 'UpdateScopes',
            path: '/users/user/{id}/update/scopes',
            method: 'POST',
            requiresArgs: true);
}

class UpdateScopesArgs extends IAPICallArgs {
  final List<String> scopes;
  final String id;

  const UpdateScopesArgs(
      {super.name = 'UpdateScopes', required this.id, required this.scopes});

  @override
  Map<String, dynamic> getData() {
    return {
      'scopes': scopes,
    };
  }

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
