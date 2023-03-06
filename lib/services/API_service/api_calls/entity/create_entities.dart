import 'package:eec_app/models/data_models/api_entity_in/api_entity_in.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class CreateEntities extends IAPICall {
  const CreateEntities()
      : super(
            name: 'CreateEntities',
            path: '/entities/create',
            method: 'POST',
            requiresArgs: true);
}

class CreateEntitiesArgs extends IAPICallArgs {
  final List<ApiEntityIn> entities;

  const CreateEntitiesArgs({super.name = 'CreateEntities', required this.entities});

  @override
  List<Map> getData() {
    return entities.map((e) => e.toJson()).toList();
  }

  @override
  String pathFormat(String path) {
    return path;
  }
}
