String handleError(
  dynamic exception,
  String Function(String) errorMapper,
) {
  return errorMapper(exception.toString());
}