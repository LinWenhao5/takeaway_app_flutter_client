import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/theme_provider.dart';

class ThemeSegment extends ConsumerWidget {
  const ThemeSegment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final currentTheme = themeModeToString(themeMode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(context.t.settings.theme, style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              segments: [
                ButtonSegment(value: 'system', label: Text(context.t.settings.themeSystem), icon: Icon(Icons.phone_android)),
                ButtonSegment(value: 'light', label: Text(context.t.settings.themeLight), icon: Icon(Icons.light_mode)),
                ButtonSegment(value: 'dark', label: Text(context.t.settings.themeDark), icon: Icon(Icons.dark_mode)),
              ],
              selected: {currentTheme},
              onSelectionChanged: (Set<String> newSelection) {
                ref.read(themeModeProvider.notifier).setThemeMode(
                  stringToThemeMode(newSelection.first),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}