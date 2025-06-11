class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final String? token;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.token,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? token,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
    );
  }
}