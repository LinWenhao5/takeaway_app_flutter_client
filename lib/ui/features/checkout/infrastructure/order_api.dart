import 'package:takeaway_app_flutter_client/api/api_client.dart' show ApiClient;

class OrderApi {
  static Future<void> createOrder(int addressId) async {
    await ApiClient.post(
      '/orders',
      body: {
        'address_id': addressId,
      },
    );
  }
}