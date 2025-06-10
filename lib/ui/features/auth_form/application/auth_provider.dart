import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/token_storage.dart';
import '../domain/auth_state.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/login_response.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final LoginResponse response = await AuthApi.login(email, password);
      state = state.copyWith(token: response.token, isLoading: false);
      await TokenStorage.saveToken(response.token!);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }

  String getErrorMessage(BuildContext context) {
    if (state.errorMessage == null) return '';
    if (state.errorMessage!.contains('Invalid credentials')) {
      return context.t.login.invalidCredentialsMessage;
    }
    return context.t.login.genericErrorMessage;
  }

  void logout() {
    state = AuthState();
  }
}


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});