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

final availableTimesProvider = FutureProvider<AvailableTimesResponse>((ref) async {
  final orderType = ref.watch(selectedOrderTypeProvider);
  final selectedDate = ref.watch(selectedDateProvider);
  return await OrderApi.fetchAvailableTimes(
    orderType: orderType,
    date: selectedDate.toIso8601String().substring(0, 10),
  );
});

final selectedOrderTypeProvider = StateProvider<OrderType>((ref) => OrderType.delivery);

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final selectedReserveTimeProvider = StateProvider<String?>((ref) => null);

