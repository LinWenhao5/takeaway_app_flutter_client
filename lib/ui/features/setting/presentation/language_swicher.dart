import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/setting/application/language_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return IconButton(
      icon: const Icon(Icons.language),
      tooltip: locale == AppLocale.en ? '切换到中文' : 'Switch to English',
      onPressed: () {
        final nextLocale = locale == AppLocale.en ? AppLocale.zh : AppLocale.en;
        ref.read(localeProvider.notifier).state = nextLocale;
        LocaleSettings.setLocale(nextLocale);
      },
    );
  }
}