import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/login_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/login_state.dart';
import 'token_storage.dart';
import 'auth_error_mapper.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  Future<void> login(String email, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final response = await AuthApi.login(email, password);
      state = state.copyWith(token: response.token, isLoading: false);
      await TokenStorage.saveToken(response.token!);
    } catch (e) {
      if (!context.mounted) return;
      final errorMessage = _handleError(context, e, mapLoginErrorToLocalizedMessage);
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
          final loginResponse = LoginResponse.fromJson(response);
          return loginResponse.getFirstError() ?? errorMapper(context, exception.toString());
        }
      } catch (_) {
        return errorMapper(context, exception.toString());
      }
    }
    return errorMapper(context, exception.toString());
  }
}