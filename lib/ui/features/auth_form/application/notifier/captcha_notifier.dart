import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/infrastructure/auth_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';
import '../state/captcha_state.dart';

class CaptchaNotifier extends StateNotifier<CaptchaState> {
  CaptchaNotifier() : super(CaptchaState());

  Future<void> generateCaptcha(String email) async {
    state = state.copyWith(isLoading: true, errorMessage: null, captchaMessage: null);
    try {
      final captcha = await AuthApi.captcha(email);
      state = state.copyWith(isLoading: false, captchaMessage: captcha.message);
    } catch (e) {
      final errorMessage = handleError(e, mapCaptchaErrorToLocalizedMessage);
      state = state.copyWith(isLoading: false, errorMessage: errorMessage, captchaMessage: null);
    }
  }
}