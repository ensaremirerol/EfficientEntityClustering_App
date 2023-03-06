import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';
import 'package:eec_app/services/snackbar_service/snackbar_service.dart';
import 'package:eec_app/utils/instance_controller.dart';
import 'package:logger/logger.dart';

class APIService {
  late Dio _dio;

  final Logger _logger = Logger();

  final String authPath;

  APIService(BaseOptions options, {required this.authPath}) {
    _dio = Dio(options);
  }

  Future<void> getToken(String username, String password) async {
    try {
      _logger.i('Getting token');
      final Response response = await _dio.post(authPath,
          data: FormData.fromMap({'username': username, 'password': password}));
      _dio.options.headers['Authorization'] =
          'Bearer ${response.data['access_token']}';
      _logger.i('Token received');
    } on DioError catch (e) {
      _logger.e('Failed to get token');
      _logger.e(e);
      InstanceController().getByType<SnackBarService>().showErrorMessage(
          'Failed to authenticate. Please check your credentials and try again.');
    }
  }

  Future<Response> call(IAPICall apiCall, IAPICallArgs? args) async {
    try {
      if ((args != null && apiCall.name != args.name)) {
        _logger.e(
            'API call name and args name do not match. apiCall.name: ${apiCall.name}, args.name: ${args.name}}');
        throw Exception(
            'API call name and args name do not match. apiCall.name: ${apiCall.name}, args.name: ${args.name}}');
      }
      if (apiCall.requiresArgs && args == null) {
        _logger.e(
            'API call requires args but none were provided. apiCall.name: ${apiCall.name}');
        throw Exception(
            'API call requires args but none were provided. apiCall.name: ${apiCall.name}');
      }
      _logger.i('Calling API: ${apiCall.name}');
      final Response response = await _dio.request(
        args?.pathFormat(apiCall.path) ?? apiCall.path,
        data: jsonEncode(args?.getData()),
        queryParameters: args?.getQuery(),
        options: Options(
          method: apiCall.method,
        ),
      );
      _logger.i('API call successful: ${apiCall.name}');
      return response;
    } on DioError catch (e) {
      _logger.e('API call failed: ${apiCall.name}');
      _logger.e(e);
      return e.response!;
    }
  }
}
