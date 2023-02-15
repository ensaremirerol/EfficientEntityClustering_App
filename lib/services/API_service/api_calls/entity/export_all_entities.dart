import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class ExportAllEntites extends IAPICall {
  const ExportAllEntites()
      : super(
            name: 'ExportAllEntites',
            path: '/entities/export/csv',
            method: 'GET',
            requiresArgs: false);
}
