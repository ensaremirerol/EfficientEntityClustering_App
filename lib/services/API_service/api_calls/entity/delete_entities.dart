import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';

class DeleteEntities extends IAPICall {
  const DeleteEntities()
      : super(
            name: 'DeleteEntities',
            path: '/entities/delete',
            method: 'DELETE',
            requiresArgs: true);
}

class DeleteEntitiesArgs extends IAPICallArgs {
  final List<String> ids;

  const DeleteEntitiesArgs({super.name = 'DeleteEntities', required this.ids});

  @override
  Map<String, dynamic> getData() {
    return {'entity_ids': ids};
  }
}
