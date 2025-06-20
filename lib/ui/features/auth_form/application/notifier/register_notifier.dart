import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/register_state.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';
import '../auth_error_mapper.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier() : super(RegisterState());

  Future<void> register(
      String name, String email, String password, String captcha, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      await AuthApi.register(name, email, password, captcha);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      if (!context.mounted) return;
      final errorMessage = handleError(context, e, mapRegisterErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
    }
  }
}