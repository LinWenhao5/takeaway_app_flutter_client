abstract class ErrorUtils {
  Map<String, List<String>>? get errors;

  String? getFirstError() {
    if (errors != null && errors!.isNotEmpty) {
      final firstKey = errors!.keys.first;
      final firstErrorList = errors![firstKey];
      if (firstErrorList != null && firstErrorList.isNotEmpty) {
        return firstErrorList.first;
      }
    }
    return null;
  }
}