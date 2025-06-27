import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/infrastructure/cart_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/add_cart_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

class AddToCartNotifier extends StateNotifier<AddToCartState> {
  AddToCartNotifier() : super(AddToCartState());

  Future<void> addToCart(int productId, int quantity) async {
    state = state.copyWith(isLoading: true, errorMessage: null, isSuccess: false);
    try {
      await CartApi.addToCart(productId, quantity);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      final errorMessage = handleError(e, mapCartErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}