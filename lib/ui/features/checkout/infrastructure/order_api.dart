import 'package:flutter/foundation.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart' show ApiClient;
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_create_response.dart';
import 'package:takeaway_app_flutter_client/ui/utils/get_platform.dart';

class OrderApi {
  static Future<OrderCreateResponse> createOrder(int addressId) async {
    final platform = getPlatform();
    final host = kIsWeb ? Uri.base.origin : null;
    final response = await ApiClient.post(
      '/orders',
      body: {
        'address_id': addressId,
        'platform': platform,
        if (host != null) 'host': host,
      },
    );
    return OrderCreateResponse.fromJson(response);
  }
}