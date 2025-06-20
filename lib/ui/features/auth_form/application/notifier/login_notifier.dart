import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/login_state.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';
import '../token_storage.dart';
import '../auth_error_mapper.dart';

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
      final errorMessage = handleError(context, e, mapLoginErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}