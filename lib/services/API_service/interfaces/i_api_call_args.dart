abstract class IAPICallArgs {
  final String name;

  const IAPICallArgs({required this.name});

  dynamic getData() {
    return {};
  }

  Map<String, dynamic> getQuery() {
    return {};
  }

  String pathFormat(String path) {
    return path;
  }
}
