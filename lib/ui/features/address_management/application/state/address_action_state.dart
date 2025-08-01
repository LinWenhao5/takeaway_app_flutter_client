enum AddressActionType { none, create, update, delete }

class AddressActionState {
  final bool isLoading;
  final String? error;
  final bool success;
  final AddressActionType action;

  AddressActionState({
    this.isLoading = false,
    this.error,
    this.success = false,
    this.action = AddressActionType.none,
  });

  AddressActionState copyWith({
    bool? isLoading,
    String? error,
    bool? success,
    AddressActionType? action,
  }) {
    return AddressActionState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      success: success ?? this.success,
      action: action ?? this.action,
    );
  }
}
