class LoginState {
  final String username;
  final String password;
  final bool isValid;
  final bool isPasswordObscured;
  final String? errorMessage;
  final bool isSubmitted; // New flag

  const LoginState({
    this.username = '',
    this.password = '',
    this.isValid = false,
    this.isPasswordObscured = true,
    this.errorMessage,
    this.isSubmitted = false, // Default to false
  });

  LoginState copyWith({
    String? username,
    String? password,
    bool? isValid,
    bool? isPasswordObscured,
    String? errorMessage,
    bool? isSubmitted,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isValid: isValid ?? this.isValid,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      errorMessage: errorMessage,
      isSubmitted: isSubmitted ?? this.isSubmitted,
    );
  }
}
