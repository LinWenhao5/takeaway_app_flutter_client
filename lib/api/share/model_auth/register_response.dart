class RegisterResponse {
  final String? message;
  final Map<String, List<String>>? errors;

  RegisterResponse({this.message, this.errors});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      errors: json['errors']
    );
  }

  String? getFirstError() {
    if (errors != null && errors!.isNotEmpty) {
      final firstErrorList = errors!.values.first;
      if (firstErrorList.isNotEmpty) {
        return firstErrorList.first;
      }
    }
    return null;
  }
}