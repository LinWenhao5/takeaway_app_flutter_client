import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_repay_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/infrastructure/order_history_api.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

class OrderRepayNotifier extends StateNotifier<OrderRepayState> {
  static const reservedTimeError = 'The reserved time is not available.';

  OrderRepayNotifier() : super(OrderRepayState());

  Future<void> repayOrder(String orderId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await OrderHistoryApi.repayOrder(orderId);
      state = state.copyWith(data: response, isLoading: false, error: null);
    } catch (e) {
      final errorMsg = handleError(
        e,
        _mapRepayError,
      );
      state = state.copyWith(
        data: null,
        isLoading: false,
        error: errorMsg,
      );
    }
  }

  String _mapRepayError(String msg) {
    if (msg.contains(reservedTimeError)) {
      state = state.copyWith(
          needChangeReserveTime: true,
        );
      return t.errors.selectedTimeUnavailable;
    }
    return t.errors.genericErrorMessage;
  }

  void reset() {
    state = OrderRepayState();
  }
}