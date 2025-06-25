import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';

class GetCartResponse {
  final List<CartItem> cart;
  final String totalPrice;
  final String totalQuantity;

  GetCartResponse({required this.cart, required this.totalPrice, required this.totalQuantity});

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      cart: (json['cart'] as List<dynamic>)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      totalPrice: json['total_price'],
      totalQuantity: json['total_quantity'],
    );
  }
}