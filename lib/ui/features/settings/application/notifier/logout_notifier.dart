import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/auth_form/application/token_storage.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/customer_account_provider.dart';

class LogoutNotifier extends StateNotifier<bool> {
  final Ref ref;
  LogoutNotifier(this.ref) : super(false);

  Future<void> logout() async {
    await TokenStorage.clearToken();
    ref.read(usernameNotifierProvider.notifier).reset();
    ref.read(orderHistoryProvider.notifier).reset();

    ref.read(cartItemsProvider.notifier).setItems([]);
    ref.read(cartSummaryProvider.notifier).updateSummary("0", "0.00");
  }
}
