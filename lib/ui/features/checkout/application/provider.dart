import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/available_times_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/infrastructure/order_api.dart';

final selectedAddressIdProvider = StateProvider<int?>((ref) => null);

final orderNotifierProvider =
    StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(),
);

final availableTimesProvider = FutureProvider.family<AvailableTimesResponse, OrderType>((ref, orderType) async {
  return await OrderApi.fetchAvailableTimes(orderType: orderType);
});