import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/language_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/domain/language_option.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    final currentOption = locale == AppLocale.en
        ? LanguageOption.english
        : LanguageOption.chinese;

    final nextOption = currentOption == LanguageOption.english
        ? LanguageOption.chinese
        : LanguageOption.english;

    return IconButton(
      icon: const Icon(Icons.language),
      tooltip: nextOption.label,
      onPressed: () {
        ref.read(localeProvider.notifier).state = nextOption.appLocale;
        LocaleSettings.setLocale(nextOption.appLocale);
      },
    );
  }
}