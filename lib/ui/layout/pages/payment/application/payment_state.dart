import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/domain/order_status_response.dart';

class OrderStatusState {
  final bool isLoading;
  final OrderStatusResponse? data;
  final String? error;

  OrderStatusState({this.isLoading = false, this.data, this.error});

  OrderStatusState copyWith({
    bool? isLoading,
    OrderStatusResponse? data,
    String? error,
  }) {
    return OrderStatusState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
