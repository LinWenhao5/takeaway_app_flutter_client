import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_cart/cart_item.dart';

class CartItemsNotifier extends StateNotifier<List<CartItem>> {
  CartItemsNotifier() : super([]);

  void setItems(List<CartItem> items) {
    state = items;
  }

  void removeItem(int itemId) {
    state = state.where((item) => item.id != itemId).toList();
  }
}