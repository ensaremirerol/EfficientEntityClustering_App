import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class ExportAllClusters extends IAPICall {
  const ExportAllClusters()
      : super(
            name: 'ExportAllClusters',
            path: '/clusters/export/csv',
            method: 'GET',
            requiresArgs: false);
}
