import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/infrastructure/order_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

class OrderNotifier extends StateNotifier<OrderState> {
  final Ref ref;
  OrderNotifier(this.ref) : super(OrderState());

  Future<void> createOrder({
    required OrderType orderType,
    int? addressId,
    required String reserveTime,
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
        reserveTime: reserveTime,
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
        error: _mapOrderError(e),
        action: OrderActionType.create,
        orderId: null,
        paymentUrl: null,
      );
    }
  }

  String _mapOrderError(dynamic e) {
    return handleError(
      e,
      (msg) {
        if (msg.contains('Selected time is not available')) {
          ref.read(selectedReserveTimeProvider.notifier).state = null;
          ref.invalidate(availableTimesProvider);
          return t.errors.selectedTimeUnavailable;
        }
        return t.errors.genericErrorMessage;
      },
    );
  }

  void reset() {
    state = OrderState();
  }
}
