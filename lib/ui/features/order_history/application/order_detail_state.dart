import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_detail_response.dart';

class OrderDetailState {
  final OrderDetailResponse? data;
  final bool isLoading;
  final String? error;

  OrderDetailState({this.data, this.isLoading = false, this.error});

  OrderDetailState copyWith({
    OrderDetailResponse? data,
    bool? isLoading,
    String? error,
  }) {
    return OrderDetailState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
