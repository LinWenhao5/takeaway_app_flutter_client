String handleError(
  dynamic exception,
  String Function(String) errorMapper, {
  int? statusCode,
  Map<int, String>? codeMapper,
}) {
  if (statusCode != null &&
      codeMapper != null &&
      codeMapper.containsKey(statusCode)) {
    return codeMapper[statusCode]!;
  }
  return errorMapper(exception.toString());
}
