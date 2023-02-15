import 'package:eec_app/services/API_service/interfaces/i_api_call.dart';

class TestCall extends IAPICall {
  const TestCall()
      : super(
            name: 'TestCall',
            path: '/',
            method: 'GET',
            requiresArgs: false);
}
