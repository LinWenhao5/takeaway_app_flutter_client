import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/captcha_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/login_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/register_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/reset_password_response.dart';

class AuthApi {
  static Future<LoginResponse> login(String email, String password) async {
    final data = await ApiClient.post(
      '/customer/login',
      body: {'email': email, 'password': password},
      shouldRedirectOn401: false,
    );
    return LoginResponse.fromJson(data);
  }

  static Future<RegisterResponse> register(
    String name,
    String email,
    String password,
    String captcha,
  ) async {
    final data = await ApiClient.post(
      '/customer/register',
      body: {
        'name': name,
        'email': email,
        'password': password,
        'captcha': captcha,
      },
    );
    return RegisterResponse.fromJson(data);
  }

  static Future<ResetPasswordResponse> resetPassword(String email, String captcha, String password) async {
    final data = await ApiClient.post('/customer/reset-password', body: {
      'email': email,
      'captcha': captcha,
      'password': password,
    });
    return ResetPasswordResponse.fromJson(data);
  }

  static Future<CaptchaResponse> captcha(String email) async {
    final captcha = await ApiClient.post(
      '/customer/generate-captcha',
      body: {'email': email},
    );
    return CaptchaResponse.fromJson(captcha);
  }
}
