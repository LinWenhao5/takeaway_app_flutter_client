import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_detail_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_detail_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_history_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_history_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_repay_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_repay_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/infrastructure/order_history_api.dart';

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, OrderHistoryState>(
      (ref) => OrderHistoryNotifier(),
    );

final orderDetailProvider =
    StateNotifierProvider<OrderDetailNotifier, OrderDetailState>(
      (ref) => OrderDetailNotifier(),
    );

final orderRepayProvider =
    StateNotifierProvider.autoDispose<OrderRepayNotifier, OrderRepayState>(
      (ref) => OrderRepayNotifier(),
    );

final updateReserveTimeProvider = FutureProvider.autoDispose.family<void, Map<String, String>>(
  (ref, params) async {
    final orderId = params['orderId']!;
    final reserveTime = params['reserveTime']!;
    await OrderHistoryApi.updateReserveTime(orderId, reserveTime);
  },
);