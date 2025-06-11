import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_auth/auth_api.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/api/share/model_auth/captcha_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_error_mapper.dart';
import '../domain/captcha_state.dart';

class CaptchaNotifier extends StateNotifier<CaptchaState> {
  CaptchaNotifier() : super(CaptchaState());

  Future<void> generateCaptcha(String email, BuildContext context) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final captcha = await AuthApi.captcha(email);
      state = state.copyWith(isLoading: false, captchaMessage: captcha.message);
    } catch (e) {
      if (!context.mounted) return;
      final errorMessage = _handleError(context, e, mapCaptchaErrorToLocalizedMessage);
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
          final captchaResponse = CaptchaResponse.fromJson(response);
          return captchaResponse.getFirstError() ?? errorMapper(context, exception.toString());
        }
      } catch (_) {
        return errorMapper(context, exception.toString());
      }
    }
    return errorMapper(context, exception.toString());
  }
}