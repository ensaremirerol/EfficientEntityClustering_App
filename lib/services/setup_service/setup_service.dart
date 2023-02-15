import 'package:dio/dio.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/repositories/entity_repository/entity_repository.dart';
import 'package:eec_app/services/API_service/api_calls/test_call.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class SetupService {
  SetupService();

  String? _baseUrl;
  String? _wsUrl;

  Logger _logger = Logger();

  bool get isConfigured => _baseUrl != null && _wsUrl != null;

  String get baseUrl => _baseUrl!;
  String get wsUrl => _wsUrl!;

  Future<bool> configure(String baseUrl, String wsUrl) async {
    _logger.i('Configuring API');

    _baseUrl = baseUrl;
    _wsUrl = wsUrl;

    APIService apiService = APIService(
      BaseOptions(
        baseUrl: baseUrl,
      ),
    );

    try {
      final response = await apiService.call(const TestCall(), null);
      if (response.statusCode != 200) {
        throw Exception('API is not responding');
      }
    } catch (e) {
      _logger.e('API is not responding');
      _logger.e(e);
      InstanceController().getByType<SnackBarService>().showErrorMessage(
          'API is not responding. Please check your connection and connection url and try again.');
      reset();
      return false;
    }

    InstanceController().addInstance(
        APIService,
        APIService(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        ));

    InstanceController().addInstance(EntityRepository, EntityRepository());

    InstanceController().addInstance(ClusterRepository, ClusterRepository());

    await InstanceController().getByType<EntityRepository>().refresh();

    await InstanceController().getByType<ClusterRepository>().refresh();

    return true;
  }

  void reset() {
    _baseUrl = null;
    _wsUrl = null;
  }
}
