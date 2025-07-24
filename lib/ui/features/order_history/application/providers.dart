import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_detail_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_detail_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_history_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_history_state.dart';

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryNotifier, OrderHistoryState>(
  (ref) => OrderHistoryNotifier(),
);

final orderDetailProvider =
    StateNotifierProvider<OrderDetailNotifier, OrderDetailState>(
  (ref) => OrderDetailNotifier(),
);