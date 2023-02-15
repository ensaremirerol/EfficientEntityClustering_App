import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class GetEntity extends IAPICall {
  const GetEntity()
      : super(
            name: 'GetEntity',
            path: '/entities/entity/{id}',
            method: 'GET',
            requiresArgs: true);
}

class GetEntityArgs extends IAPICallArgs {
  final String id;

  const GetEntityArgs({super.name = 'GetEntity', required this.id});

  @override
  String pathFormat(String path) {
    return path.replaceAll('{id}', id);
  }
}
