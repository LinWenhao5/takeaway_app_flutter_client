import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/notifier/logout_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/notifier/username_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/state/username_state.dart';

final usernameNotifierProvider =
    StateNotifierProvider<UsernameNotifier, UsernameState>((ref) {
      return UsernameNotifier();
    });

final logoutNotifierProvider = StateNotifierProvider<LogoutNotifier, bool>(
  (ref) => LogoutNotifier(ref),
);
