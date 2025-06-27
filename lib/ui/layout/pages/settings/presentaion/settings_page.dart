import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/account_settings_tile.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/language_segment.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/theme_segment.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/greeting_section.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        GreetingSection(),
        AccountSettingsTile(),
        const Divider(),
        ThemeSegment(),
        const Divider(),
        const LanguageSegment(),
      ],
    );
  }
}