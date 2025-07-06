import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/add_to_cart_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/delete_from_cart_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/get_cart_response.dart';

class CartApi {
  static Future<AddToCartResponse> addToCart(int productId, int quantity) async {
    final response = await ApiClient.post(
      '/cart',
      body: {
        'product_id': productId,
        'quantity': quantity,
      },
    );
    return AddToCartResponse.fromJson(response);
  }

  static Future<GetCartResponse> getCart() async {
    final response = await ApiClient.get('/cart');
    return GetCartResponse.fromJson(response);
  }

  static Future<DeleteFromCartResponse> deleteFromCart(int productId) async {
    final response = await ApiClient.delete(
      '/cart/remove',
      body: {
        'product_id': productId,
      },
    );
    return DeleteFromCartResponse.fromJson(response);
  }

  static Future<DeleteFromCartResponse> deleteQuantityFromCart(int productId, int quantity) async {
    final response = await ApiClient.delete(
      '/cart/remove-quantity',
      body: {
        'product_id': productId,
        'quantity': quantity,
      },
    );
    return DeleteFromCartResponse.fromJson(response);
  }
}