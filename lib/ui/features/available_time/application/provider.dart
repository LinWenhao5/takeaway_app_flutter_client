import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/domain/available_times_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/infrastructure/available_time_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final availableTimesProvider = FutureProvider.autoDispose.family<AvailableTimesResponse, AvailableTimesParams>((ref, params) async {
  return await AvailableTimeApi.fetchAvailableTimes(
    orderType: params.orderType,
    date: params.selectedDate.toIso8601String().substring(0, 10),
  );
});

class AvailableTimesParams {
  final OrderType orderType;
  final DateTime selectedDate;

  AvailableTimesParams({
    required this.orderType,
    required this.selectedDate,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailableTimesParams &&
          runtimeType == other.runtimeType &&
          orderType == other.orderType &&
          selectedDate == other.selectedDate;

  @override
  int get hashCode => orderType.hashCode ^ selectedDate.hashCode;
}