class AddToCartState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  AddToCartState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  AddToCartState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return AddToCartState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
