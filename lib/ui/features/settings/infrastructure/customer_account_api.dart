import 'package:takeaway_app_flutter_client/api/api_client.dart';
import '../domain/username_response.dart';

class CustomerAccountApi {
  static Future<UsernameResponse> getUsername() async {
    ApiClient.shouldRedirectOn401 = false;
    final response = await ApiClient.get('/customer/username');
    return UsernameResponse.fromJson(response);
  }
}