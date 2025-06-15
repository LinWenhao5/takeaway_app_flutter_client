import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/register_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/domain/register_state.dart';
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
      final errorMessage = _handleError(context, e, mapRegisterErrorToLocalizedMessage);
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
          final registerResponse = RegisterResponse.fromJson(response);
          return registerResponse.getFirstError() ?? errorMapper(context, exception.toString());
        }
      } catch (_) {
        return errorMapper(context, exception.toString());
      }
    }
    return errorMapper(context, exception.toString());
  }
}