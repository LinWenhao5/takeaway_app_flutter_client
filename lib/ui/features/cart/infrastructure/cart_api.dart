import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/add_to_cart_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/delete_from_cart_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/get_cart_response.dart';

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

  static Future<GetCartResponse> getCart() async {
    try {
      final response = await ApiClient.get('/cart');
      return GetCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<DeleteFromCartResponse> deleteFromCart(int productId) async {
    try {
      final response = await ApiClient.delete(
        '/cart/remove',
        body: {
          'product_id': productId,
        },
      );
      return DeleteFromCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}