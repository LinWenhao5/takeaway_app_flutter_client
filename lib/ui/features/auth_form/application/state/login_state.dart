class LoginState {
  final bool success;
  final bool isLoading;
  final String? errorMessage;
  final String? token;

  LoginState({
    this.success = false,
    this.isLoading = false,
    this.errorMessage,
    this.token,
  });

  LoginState copyWith({
    bool? success,
    bool? isLoading,
    String? errorMessage,
    String? token,
  }) {
    return LoginState(
      success: success ?? this.success,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      token: token ?? this.token,
    );
  }
}
