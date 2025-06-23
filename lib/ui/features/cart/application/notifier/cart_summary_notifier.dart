import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartSummary {
  final String totalQuantity;
  final String totalPrice;

  CartSummary({required this.totalQuantity, required this.totalPrice});
}

class CartSummaryNotifier extends StateNotifier<CartSummary> {
  CartSummaryNotifier() : super(CartSummary(totalQuantity: "0", totalPrice: "0.00"));

  void updateSummary(String totalQuantity, String totalPrice) {
    state = CartSummary(totalQuantity: totalQuantity, totalPrice: totalPrice);
  }
}