import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/login_response.dart';

class AuthApi {
  static Future<LoginResponse> login(String email, String password) async {
    final data = await ApiClient.post('/customer/login', body: {'email': email, 'password': password});
    return LoginResponse.fromJson(data);
  }
}