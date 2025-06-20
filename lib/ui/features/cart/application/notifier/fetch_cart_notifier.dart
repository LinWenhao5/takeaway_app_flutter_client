import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_cart/cart_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/fetch_cart_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

class FetchCartNotifier extends StateNotifier<FetchCartState> {
  FetchCartNotifier() : super(FetchCartState.initial());

  Future<void> fetchCart(BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final cartResponse = await CartApi.getCart();
      state = state.copyWith(isLoading: false, getCartResponse: cartResponse);
    } catch (e) {
      final errorMessage = handleError(context, e, mapCartErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}