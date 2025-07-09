enum OrderActionType { none, create }

class OrderState {
  final bool isLoading;
  final String? error;
  final bool success;
  final OrderActionType action;

  OrderState({
    this.isLoading = false,
    this.error,
    this.success = false,
    this.action = OrderActionType.none,
  });

  OrderState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
    OrderActionType? action,
  }) {
    return OrderState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success ?? this.success,
      action: action ?? this.action,
    );
  }
}