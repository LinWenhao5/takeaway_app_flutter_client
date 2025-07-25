import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/infrastructure/order_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  OrderNotifier() : super(OrderState());

  Future<void> createOrder({
    required OrderType orderType,
    int? addressId,
  }) async {
    state = state.copyWith(
      isLoading: true,
      success: false,
      error: null,
      action: OrderActionType.create,
      orderId: null,
      paymentUrl: null,
    );
    try {
      final response = await OrderApi.createOrder(
        orderType: orderType,
        addressId: addressId,
      );
      state = state.copyWith(
        isLoading: false,
        success: response.success,
        error: null,
        action: OrderActionType.create,
        orderId: response.orderId,
        paymentUrl: response.paymentUrl,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: e.toString(),
        action: OrderActionType.create,
        orderId: null,
        paymentUrl: null,
      );
    }
  }

  void reset() {
    state = OrderState();
  }
}