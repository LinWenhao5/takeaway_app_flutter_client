import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address_create_request.dart';
import '../domain/address_response.dart';

class AddressApi {
  static Future<AddressResponse> getAddresses() async {
    final response = await ApiClient.get('/address');
    return AddressResponse.fromJson(response);
  }

  static Future<void> createAddress(AddressCreateRequest data) async {
    await ApiClient.post('/address', body: data.toJson());
  }

  static Future<void> deleteAddress(int id) async {
    await ApiClient.delete('/address/$id');
  }

  static Future<void> updateAddress(int id, AddressCreateRequest data) async {
    await ApiClient.put('/address/$id', body: data.toJson());
  }
}