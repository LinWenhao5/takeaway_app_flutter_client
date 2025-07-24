import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_detail_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/infrastructure/order_history_api.dart';

class OrderDetailNotifier extends StateNotifier<OrderDetailState> {
  OrderDetailNotifier() : super(OrderDetailState());

  Future<void> fetchOrderDetail(String orderId) async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await OrderHistoryApi.getOrderDetail(orderId);
      state = state.copyWith(data: response, isLoading: false, error: null);
    } catch (e) {
      state = state.copyWith(data: null, isLoading: false, error: e.toString());
    }
  }

  void reset() {
    state = OrderDetailState();
  }
}