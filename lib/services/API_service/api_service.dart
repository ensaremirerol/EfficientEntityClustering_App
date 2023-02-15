import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';
import 'package:eec_app/services/API_service/interfaces/i_api_call_args.dart';
import 'package:logger/logger.dart';

class APIService {
  late Dio _dio;

  final Logger _logger = Logger();

  APIService(BaseOptions options) {
    _dio = Dio(options);
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
        options: Options(
          method: apiCall.method,
        ),
      );
      _logger.i('API call successful: ${apiCall.name}');
      _logger.i(response.data);
      return response;
    } on DioError catch (e) {
      _logger.e('API call failed: ${apiCall.name}');
      _logger.e(e);
      return e.response!;
    }
  }
}
