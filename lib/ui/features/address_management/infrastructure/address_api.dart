import 'package:takeaway_app_flutter_client/api/api_client.dart';
import '../domain/address_response.dart';

class AddressApi {
  static Future<AddressResponse> getAddresses() async {
    final response = await ApiClient.get('/address');
    return AddressResponse.fromJson(response);
  }
}