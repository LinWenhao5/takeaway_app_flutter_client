class AuthState {
  final String? token;
  final bool isLoading;
  final String? errorMessage;

  AuthState({
    this.token,
    this.isLoading = false,
    this.errorMessage,
  });

  AuthState copyWith({
    String? token,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AuthState(
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}