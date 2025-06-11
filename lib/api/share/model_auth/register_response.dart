import 'package:takeaway_app_flutter_client/api/share/utils/error_utils.dart';

class RegisterResponse extends ErrorUtils {
  final String? message;
  @override
  final Map<String, List<String>>? errors;

  RegisterResponse({this.message, this.errors});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      message: json['message'],
      errors: json['errors']
    );
  }
}