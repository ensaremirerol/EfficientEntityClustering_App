import 'package:logger/logger.dart';

/// Singleton controller for global variables.
class InstanceController {
  InstanceController._();

  static final InstanceController _instance = InstanceController._();

  factory InstanceController() => _instance;

  final Map<dynamic, Object> _instances = {};

  final Logger _logger = Logger();

  void addInstance(dynamic key, Object instance) {
    _instances[key] = instance;
    _logger.i('Instance added: $key');
  }

  operator [](dynamic key) => _instances[key];

  T getByType<T>() {
    return _instances[T] as T;
  }

  T getByKey<T>(dynamic key) {
    return _instances[key] as T;
  }

  void removeByKey(dynamic key) {
    _instances.remove(key);
    _logger.i('Instance removed: $key');
  }

  void removeByType<T>() {
    _instances.remove(T);
    _logger.i('Instance removed: $T');
  }

  void removeAll() {
    _instances.clear();
    _logger.i('All instances removed');
  }
}
