import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/language_segment.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/theme_segment.dart';
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: Text('Account Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // TODO: Navigate to account settings page
          },
        ),
        const Divider(),
        ThemeSegment(),
        const Divider(),
        const LanguageSegment(),
      ],
    );
  }
}