import 'package:eec_app/models/data_models/api_entity_in/api_entity_in.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class UpdateEntity extends IAPICall {
  const UpdateEntity()
      : super(
            name: 'UpdateEntity',
            path: '/entities/entity/{id}/update',
            method: 'POST',
            requiresArgs: true);
}

class UpdateEntityArgs extends IAPICallArgs {
  final ApiEntityIn entity;

  const UpdateEntityArgs({super.name = 'UpdateEntity', required this.entity});

  @override
  Map<String, dynamic> getData() {
    return entity.toJson();
  }
}
