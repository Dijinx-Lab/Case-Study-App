extension StringExtensions on String {
  String addQueryParam(String key, String value) {
    if (contains('?')) {
      return '$this&$key=${Uri.encodeComponent(value)}';
    } else {
      return '$this?$key=${Uri.encodeComponent(value)}';
    }
  }

  String addRouteParam(String value) {
    if (!endsWith('/')) {
      return '$this/$value';
    } else {
      return '$this$value';
    }
  }
}
