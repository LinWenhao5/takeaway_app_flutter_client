import 'package:takeaway_app_flutter_client/api/api_client.dart';
import '../domain/username_response.dart';

class CustomerAccountApi {
  static Future<UsernameResponse> getUsername() async {
    final response = await ApiClient.get('/customer/username', shouldRedirectOn401: false);
    return UsernameResponse.fromJson(response);
  }
}