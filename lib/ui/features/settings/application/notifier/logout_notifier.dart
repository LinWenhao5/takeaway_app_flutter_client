import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/token_storage.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/customer_account_provider.dart';

class LogoutNotifier extends StateNotifier<bool> {
  final Ref ref;
  LogoutNotifier(this.ref) : super(false);

  Future<void> logout() async {
    await TokenStorage.clearToken();
    ref.read(usernameNotifierProvider.notifier).reset();
  }
}