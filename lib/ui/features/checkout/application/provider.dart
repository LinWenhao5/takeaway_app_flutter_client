import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';

final selectedAddressIdProvider = StateProvider<int?>((ref) => null);

final orderNotifierProvider =
    StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(),
);