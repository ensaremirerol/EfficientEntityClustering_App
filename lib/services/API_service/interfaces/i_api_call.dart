abstract class IAPICall {
  const IAPICall(
      {required this.name,
      required this.path,
      required this.method,
      required this.requiresArgs});

  final String name;
  final String path;
  final String method;
  final bool requiresArgs;
}
