import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/infrastructure/cart_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/fetch_cart_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';

class FetchCartNotifier extends StateNotifier<FetchCartState> {
  FetchCartNotifier(this.ref) : super(FetchCartState.initial());

  final Ref ref;

  Future<void> fetchCart() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final cartResponse = await CartApi.getCart();
      state = state.copyWith(isLoading: false, getCartResponse: cartResponse);

      ref.read(cartItemsProvider.notifier).setItems(cartResponse.cart);
      ref.read(cartSummaryProvider.notifier).updateSummary(
        cartResponse.totalQuantity,
        cartResponse.totalPrice,
      );
    } catch (e) {
      final errorMessage = handleError(e, mapCartErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}