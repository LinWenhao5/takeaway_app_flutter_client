import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_exception.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/state/username_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/infrastructure/customer_account_api.dart';

class UsernameNotifier extends StateNotifier<UsernameState> {
  UsernameNotifier() : super(UsernameState(isLoading: true)) {
    fetchUsername();
  }

  void reset() {
    state = UsernameState(username: null, error: null, errorCode: 401);
  }

  Future<void> fetchUsername() async {
    state = state.copyWith(isLoading: true, error: null, errorCode: null);
    try {
      final response = await CustomerAccountApi.getUsername();
      state = state.copyWith(isLoading: false, username: response.username, error: null, errorCode: null);
    } catch (e) {
      int? code;
      String? message;
      if (e is ApiException) {
        code = e.statusCode;
        message = e.responseBody?.toString();
      } else {
        message = e.toString();
      }
      state = state.copyWith(isLoading: false, username: null, error: message, errorCode: code);
    }
  }
}