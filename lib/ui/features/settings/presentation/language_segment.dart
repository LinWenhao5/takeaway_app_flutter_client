import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/language_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/domain/language_option.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class LanguageSegment extends ConsumerWidget {
  const LanguageSegment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    final currentLanguage = LanguageOption.values.firstWhere(
      (opt) => opt.appLocale == locale,
      orElse: () => LanguageOption.english,
    ).name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text('Language', style: Theme.of(context).textTheme.titleMedium),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<String>(
              segments: LanguageOption.values
                  .map((opt) => ButtonSegment(
                        value: opt.name,
                        label: Text(opt.label),
                      ))
                  .toList(),
              selected: {currentLanguage},
              onSelectionChanged: (Set<String> newSelection) async {
                final selected = LanguageOption.values.firstWhere((opt) => opt.name == newSelection.first);
                await ref.read(localeProvider.notifier).setLocale(selected.appLocale);
                LocaleSettings.setLocale(selected.appLocale);
              },
            ),
          ),
        ),
      ],
    );
  }
}