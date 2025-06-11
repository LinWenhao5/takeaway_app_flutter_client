
import 'package:takeaway_app_flutter_client/api/share/utils/error_utils.dart';

class CaptchaResponse extends ErrorUtils {
  final String message;
  @override
  final Map<String, List<String>>? errors;

  CaptchaResponse({required this.message, this.errors});

  factory CaptchaResponse.fromJson(Map<String, dynamic> json) {
    return CaptchaResponse(
      message: json['message'],
      errors: json['errors'],
    );
  }
}