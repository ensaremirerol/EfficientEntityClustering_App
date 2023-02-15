import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class DeleteEntity extends IAPICall {
  const DeleteEntity()
      : super(
            name: 'DeleteEntity',
            path: '/entities/delete-entity/{id}',
            method: 'DELETE',
            requiresArgs: true);
}

class DeleteEntityArgs extends IAPICallArgs {
  final String id;

  const DeleteEntityArgs({super.name = 'DeleteEntity', required this.id});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
