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

  static const _unset = Object();

  UsernameState copyWith({
    bool? isLoading,
    Object? username = _unset,
    Object? error = _unset,
    Object? errorCode = _unset,
  }) {
    return UsernameState(
      isLoading: isLoading ?? this.isLoading,
      username: username == _unset ? this.username : username as String?,
      error: error == _unset ? this.error : error as String?,
      errorCode: errorCode == _unset ? this.errorCode : errorCode as int?,
    );
  }
}