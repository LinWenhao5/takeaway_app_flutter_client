import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/infrastructure/cart_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/state/delete_cart_item_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

class DeleteCartItemNotifier extends StateNotifier<DeleteCartItemState> {
  DeleteCartItemNotifier() : super(DeleteCartItemState());

  Future<void> deleteCartItem(int productId, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null, isSuccess: false);
    try {
      await CartApi.deleteFromCart(productId);
      state = state.copyWith(isLoading: false, isSuccess: true);
    } catch (e) {
      final errorMessage = handleError(context, e, mapCartErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}