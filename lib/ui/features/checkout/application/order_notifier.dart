import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/infrastructure/order_api.dart';


class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier() : super(OrderState());

  Future<void> createOrder(int addressId) async {
    state = state.copyWith(
      isLoading: true,
      success: false,
      error: null,
      action: OrderActionType.create,
    );
    try {
      await OrderApi.createOrder(addressId);
      state = state.copyWith(
        isLoading: false,
        success: true,
        error: null,
        action: OrderActionType.create,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: e.toString(),
        action: OrderActionType.create,
      );
    }
  }

  void reset() {
    state = OrderState();
  }
}