import 'package:dio/dio.dart';
import 'package:eec_app/repositories/cluster_repository/cluster_repository.dart';
import 'package:eec_app/repositories/entity_repository/entity_repository.dart';
import 'package:eec_app/repositories/user_repository/user_repository.dart';
import 'package:eec_app/services/API_service/api_calls/test_call.dart';
import 'package:eec_app/services/API_service/api_service.dart';
import 'package:eec_app/services/labeling_service/labeling_service.dart';
import 'package:eec_app/services/log_service/log_service.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class SetupService {
  SetupService();

  String? _baseUrl;
  String? _wsUrl;

  final Logger _logger = Logger();

  bool get isConfigured => _baseUrl != null && _wsUrl != null;

  String get baseUrl => _baseUrl!;
  String get wsUrl => _wsUrl!;

  Future<bool> configure(
      String baseUrl, String wsUrl, String username, String password) async {
    _logger.i('Configuring API');

    _baseUrl = baseUrl;
    _wsUrl = wsUrl;

    final APIService apiService = APIService(
      BaseOptions(
        baseUrl: baseUrl,
      ),
      authPath: '/auth/login',
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
    try {
      await apiService.getToken(username, password);
    } catch (e) {
      _logger.e('Failed to authenticate');
      _logger.e(e);
      InstanceController().getByType<SnackBarService>().showErrorMessage(
          'Failed to authenticate. Please check your credentials and try again.');
      reset();
      return false;
    }

    InstanceController().addInstance(APIService, apiService);

    InstanceController().addInstance(EntityRepository, EntityRepository());

    InstanceController().addInstance(ClusterRepository, ClusterRepository());

    InstanceController().addInstance(LabelingService, LabelingService());

    InstanceController().addInstance(UserRepository, UserRepository());

    await InstanceController().getByType<EntityRepository>().refresh();

    await InstanceController().getByType<ClusterRepository>().refresh();

    await InstanceController().getByType<UserRepository>().getCurrentUser();

    await InstanceController().getByType<UserRepository>().refresh();

    _logger.i('API configured');

    _logger.i('Configuring WS');

    InstanceController().getByType<LogService>().baseUrl = wsUrl;

    _logger.i('WS configured');

    return true;
  }

  void reset() {
    _baseUrl = null;
    InstanceController().getByType<EntityRepository>().dispose();
    InstanceController().getByType<ClusterRepository>().dispose();
    InstanceController().getByType<UserRepository>().dispose();
    InstanceController().removeByKey(APIService);
    InstanceController().removeByKey(EntityRepository);
    InstanceController().removeByKey(ClusterRepository);
    InstanceController().removeByKey(LabelingService);
    InstanceController().removeByKey(UserRepository);
    _wsUrl = null;
  }
}
