
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/add_cart_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/add_cart_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/delete_cart_item_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/delete_cart_item_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/notifier/fetch_cart_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/fetch_cart_state.dart';

final addToCartProvider =
    StateNotifierProvider<AddToCartNotifier, AddToCartState>(
  (ref) => AddToCartNotifier(),
);

final fetchCartProvider =
    StateNotifierProvider<FetchCartNotifier, FetchCartState>(
  (ref) => FetchCartNotifier(),
);

final deleteCartItemProvider =
    StateNotifierProvider<DeleteCartItemNotifier, DeleteCartItemState>(
  (ref) => DeleteCartItemNotifier(),
);