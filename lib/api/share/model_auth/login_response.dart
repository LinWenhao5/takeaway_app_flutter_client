import 'package:takeaway_app_flutter_client/api/share/utils/error_utils.dart';

class LoginResponse extends ErrorUtils {
  final String? token;
  final String message;
  @override
  final Map<String, List<String>>? errors;

  LoginResponse({
    this.token,
    required this.message,
    this.errors,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json['token'],
      message: json['message'],
      errors: json['errors'],
    );
  }
}