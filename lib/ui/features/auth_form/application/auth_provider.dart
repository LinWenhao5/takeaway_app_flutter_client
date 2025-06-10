import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/login_response.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/register_response.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/token_storage.dart';
import '../domain/auth_state.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await AuthApi.login(email, password);
      state = state.copyWith(token: response.token, isLoading: false);
      await TokenStorage.saveToken(response.token!);
    } catch (e) {
      if (!context.mounted) return;
      final errorMessage = _handleError(context, e, _mapLoginErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }

  Future<void> register(
      String name, String email, String password, String captcha, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await AuthApi.register(name, email, password, captcha);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      if (!context.mounted) return;
      final errorMessage = _handleError(context, e, _mapRegisterErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }

  String _handleError(
    BuildContext context,
    dynamic exception,
    String Function(BuildContext, String) errorMapper,
  ) {
    if (exception is ApiException) {
      try {
        final response = exception.responseBody;
        if (response != null) {
          try {
            final loginResponse = LoginResponse.fromJson(response);
            return loginResponse.getFirstError() ?? errorMapper(context, exception.toString());
          } catch (_) {
            final registerResponse = RegisterResponse.fromJson(response);
            return registerResponse.getFirstError() ?? errorMapper(context, exception.toString());
          }
        }
      } catch (_) {
        return errorMapper(context, exception.toString());
      }
    }
    return errorMapper(context, exception.toString());
  }

  String _mapLoginErrorToLocalizedMessage(BuildContext context, String error) {
    if (error.contains('Invalid credentials')) {
      return context.t.login.invalidCredentialsMessage;
    }
    if (error.contains('email')) {
      return context.t.login.invalidEmailFormatMessage;
    }
    if (error.contains('password')) {
      return context.t.login.invalidPasswordMessage;
    }
    return context.t.login.genericErrorMessage;
  }

  String _mapRegisterErrorToLocalizedMessage(BuildContext context, String error) {
    if (error.contains('email')) {
      return context.t.register.emailTakenMessage;
    }
    if (error.contains('captcha')) {
      return context.t.register.invalidCaptchaMessage;
    }
    return context.t.register.genericErrorMessage;
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});