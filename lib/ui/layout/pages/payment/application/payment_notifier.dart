import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/application/payment_state.dart';
import '../infrastructure/payment_api.dart';

class PaymentNotifier extends StateNotifier<OrderStatusState> {
  PaymentNotifier() : super(OrderStatusState());

  Future<void> fetchOrderStatus(int orderId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await PaymentApi.getOrderStatus(orderId);
      state = state.copyWith(isLoading: false, data: response, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
