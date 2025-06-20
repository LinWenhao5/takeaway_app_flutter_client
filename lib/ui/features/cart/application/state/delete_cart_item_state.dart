class DeleteCartItemState {
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  DeleteCartItemState({
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  DeleteCartItemState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isSuccess,
  }) {
    return DeleteCartItemState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}