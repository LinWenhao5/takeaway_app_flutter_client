import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_history_response.dart';

class OrderHistoryState {
  final bool isLoading;
  final String? error;
  final OrderHistoryResponse? data;

  OrderHistoryState({
    this.isLoading = false,
    this.error,
    this.data,
  });

  OrderHistoryState copyWith({
    bool? isLoading,
    String? error,
    OrderHistoryResponse? data,
  }) {
    return OrderHistoryState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      data: data ?? this.data,
    );
  }
}