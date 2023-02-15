import 'package:web_socket_channel/web_socket_channel.dart';

class LogService {
  final String baseUrl = 'ws://0.0.0.0:8000';

  late WebSocketChannel _socket;

  LogService() {
    final _uri =
        Uri(scheme: 'ws', host: '0.0.0.0', port: 8000, path: '/ws');
    _socket = WebSocketChannel.connect(_uri);

    _socket.stream.listen((event) {
      print(event);
    });
  }
}
