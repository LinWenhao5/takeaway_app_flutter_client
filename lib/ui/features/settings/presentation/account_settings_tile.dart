import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/customer_account_provider.dart';

class AccountSettingsTile extends ConsumerWidget {
  const AccountSettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(usernameNotifierProvider);

    if (usernameState.username == null) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: const Icon(Icons.person_outline),
      title: const Text('Account Settings'),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}