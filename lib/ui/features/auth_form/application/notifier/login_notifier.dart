import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/infrastructure/auth_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/state/login_state.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';
import '../token_storage.dart';
import '../auth_error_mapper.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier() : super(LoginState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null, success: false);
    try {
      final response = await AuthApi.login(email, password);
      await TokenStorage.saveToken(response.token!);
      state = state.copyWith(
        token: response.token,
        isLoading: false,
        success: true,
      );
    } catch (e) {
      final errorMessage = handleError(e, mapLoginErrorToLocalizedMessage);
      state = state.copyWith(
        isLoading: false,
        errorMessage: errorMessage,
        success: false,
      );
    }
  }
}
