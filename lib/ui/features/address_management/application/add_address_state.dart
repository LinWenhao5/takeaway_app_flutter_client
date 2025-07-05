class AddAddressState {
  final bool isLoading;
  final String? error;
  final bool success;

  AddAddressState({
    this.isLoading = false,
    this.error,
    this.success = false,
  });

  AddAddressState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
  }) {
    return AddAddressState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success ?? this.success,
    );
  }
}