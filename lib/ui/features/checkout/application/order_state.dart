enum OrderActionType { none, create }

class OrderState {
  final bool isLoading;
  final String? error;
  final bool success;
  final OrderActionType action;
  final int? orderId;
  final String? paymentUrl;

  OrderState({
    this.isLoading = false,
    this.error,
    this.success = false,
    this.action = OrderActionType.none,
    this.orderId,
    this.paymentUrl,
  });

  OrderState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
    OrderActionType? action,
    int? orderId,
    String? paymentUrl,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success ?? this.success,
      action: action ?? this.action,
      orderId: orderId ?? this.orderId,
      paymentUrl: paymentUrl ?? this.paymentUrl,
    );
  }
}