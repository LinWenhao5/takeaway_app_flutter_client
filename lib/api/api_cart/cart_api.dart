import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_cart/add_to_cart_response.dart';

class CartApi {
  static Future<AddToCartResponse> addToCart(int productId, int quantity) async {
    try {
      final response = await ApiClient.post(
        '/cart/add',
        body: {
          'product_id': productId,
          'quantity': quantity,
        },
      );
      return AddToCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}