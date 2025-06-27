import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localeProvider = StateNotifierProvider<LocaleNotifier, AppLocale>(
  (ref) => LocaleNotifier(),
);

class LocaleNotifier extends StateNotifier<AppLocale> {
  static const _key = 'locale';

  LocaleNotifier() : super(AppLocale.en) {
    load();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString(_key);
    if (code != null) {
      final locale = AppLocale.values.firstWhere(
        (e) => e.languageCode == code,
        orElse: () => AppLocale.en,
      );
      state = locale;
      LocaleSettings.setLocale(locale);
    } else {
      LocaleSettings.setLocale(state);
    }
  }

  Future<void> setLocale(AppLocale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
    LocaleSettings.setLocale(locale);
  }
}