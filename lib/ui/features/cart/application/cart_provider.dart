import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/add_cart_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/add_cart_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/delete_cart_item_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/cart_items_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/cart_summary_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/delete_cart_item_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/fetch_cart_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/fetch_cart_state.dart';

final addToCartProvider = StateNotifierProvider.family<AddToCartNotifier, AddToCartState, int>(
  (ref, productId) => AddToCartNotifier(),
);

final fetchCartProvider =
    StateNotifierProvider<FetchCartNotifier, FetchCartState>(
  (ref) => FetchCartNotifier(ref),
);

final deleteCartItemProvider =
    StateNotifierProvider<DeleteCartItemNotifier, DeleteCartItemState>(
  (ref) => DeleteCartItemNotifier(),
);

final cartItemsProvider = StateNotifierProvider<CartItemsNotifier, List<CartItem>>(
  (ref) => CartItemsNotifier(),
);

final cartSummaryProvider = StateNotifierProvider<CartSummaryNotifier, CartSummary>(
  (ref) => CartSummaryNotifier(),
);