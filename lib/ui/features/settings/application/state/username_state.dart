class UsernameState {
  final bool isLoading;
  final String? username;
  final String? error;
  final int? errorCode;

  UsernameState({
    this.isLoading = false,
    this.username,
    this.error,
    this.errorCode,
  });

  UsernameState copyWith({
    bool? isLoading,
    String? username,
    String? error,
    int? errorCode,
  }) {
    return UsernameState(
      isLoading: isLoading ?? this.isLoading,
      username: username ?? this.username,
      error: error ?? this.error,
      errorCode: errorCode ?? this.errorCode,
    );
  }
}