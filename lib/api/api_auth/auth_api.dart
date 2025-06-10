import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/login_response.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/register_response.dart';

class AuthApi {
  static Future<LoginResponse> login(String email, String password) async {
    try {
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
}