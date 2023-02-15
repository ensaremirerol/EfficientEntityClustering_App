import 'package:web_socket_channel/web_socket_channel.dart';

class LogService {
  String? _baseUrl;

  late WebSocketChannel _socket;

  set baseUrl(String? baseUrl) {
    _baseUrl = baseUrl;
  }

  LogService() {}

  void connect() {
    _socket = WebSocketChannel.connect(Uri.parse('$_baseUrl/ws'));
  }

  Stream get stream => _socket.stream;

  void close() {
    _socket.sink.close();
  }
}
