import 'package:eec_app/models/data_models/api_entity_in/api_entity_in.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class CreateEntity extends IAPICall {
  const CreateEntity()
      : super(
            name: 'CreateEntity',
            path: '/entities/create-entity',
            method: 'POST',
            requiresArgs: true);
}

/*

  class EntityIn(BaseModel):
    entity_id: str
    mention: str
    entity_source: str
    entity_source_id: str

*/

class CreateEntityArgs extends IAPICallArgs {
  final ApiEntityIn entity;

  const CreateEntityArgs({
    super.name = 'CreateEntity',
    required this.entity,
  });

  @override
  Map<String, dynamic> getData() {
    return entity.toJson();
  }
}
