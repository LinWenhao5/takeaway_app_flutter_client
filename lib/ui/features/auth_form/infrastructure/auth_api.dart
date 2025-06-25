import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/captcha_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/login_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/register_response.dart';

class AuthApi {
  static Future<LoginResponse> login(String email, String password) async {
    try {
      ApiClient.shouldRedirectOn401 = false; 
      final data = await ApiClient.post('/customer/login', body: {'email': email, 'password': password});
      return LoginResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RegisterResponse> register(String name, String email, String password, String captcha) async {
    try {
      final data = await ApiClient.post('/customer/register', body: {
        'name': name,
        'email': email,
        'password': password,
        'captcha': captcha,
      });
      return RegisterResponse.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }

  static Future<CaptchaResponse> captcha(String email) async {
    try {
      final captcha = await ApiClient.post('/customer/generate-captcha', body: {
        'email': email,
      });
      return CaptchaResponse.fromJson(captcha);
    } catch (e) {
      rethrow;
    }
  }
}