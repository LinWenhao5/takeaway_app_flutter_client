import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_repay_response.dart';

class OrderRepayState {
  final bool isLoading;
  final String? error;
  final OrderRepayResponse? data;
  final bool needChangeReserveTime;

  OrderRepayState({
    this.isLoading = false,
    this.error,
    this.data,
    this.needChangeReserveTime = false,
  });

  OrderRepayState copyWith({
    bool? isLoading,
    String? error,
    OrderRepayResponse? data,
    bool? needChangeReserveTime,
  }) {
    return OrderRepayState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      data: data ?? this.data,
      needChangeReserveTime: needChangeReserveTime ?? this.needChangeReserveTime,
    );
  }

  @override
  String toString() {
    return 'OrderRepayState(isLoading: $isLoading, error: $error, data: $data, needChangeReserveTime: $needChangeReserveTime)';
  }
}