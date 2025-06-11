class CaptchaState {
  final bool isLoading;
  final String? errorMessage;
  final String? captchaMessage;

  CaptchaState({
    this.isLoading = false,
    this.errorMessage,
    this.captchaMessage,
  });

  CaptchaState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? captchaMessage,
  }) {
    return CaptchaState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      captchaMessage: captchaMessage ?? this.captchaMessage,
    );
  }
}