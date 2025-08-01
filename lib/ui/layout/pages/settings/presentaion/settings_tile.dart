import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import '../../../../features/settings/application/customer_account_provider.dart';

class SettingsTile extends ConsumerWidget {
  const SettingsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(usernameNotifierProvider);

    if (usernameState.username == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text(context.t.settings.account_settings),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pushNamed('/account-settings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.receipt_long),
          title: Text(context.t.settings.order_history),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pushNamed('/order-history');
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on_outlined),
          title: Text(context.t.settings.address_management),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).pushNamed('/address-management');
          },
        ),
      ],
    );
  }
}
