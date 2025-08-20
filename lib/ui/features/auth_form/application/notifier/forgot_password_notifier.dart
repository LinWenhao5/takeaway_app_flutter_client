import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/auth_error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/forget_password_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/infrastructure/auth_api.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';


class ForgotPasswordNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordNotifier() : super(ForgotPasswordState());

  Future<void> resetPassword(String email, String captcha, String password) async {
    state = state.copyWith(loading: true, error: null);
    try {
      await AuthApi.resetPassword(email, captcha, password);
      state = state.copyWith(loading: false, success: true);
    } catch (e) {
      state = state.copyWith(loading: false, error: handleError(e, mapForgotPasswordErrorToLocalizedMessage));
    }
  }

  void reset() {
    state = ForgotPasswordState();
  }
}