import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

enum LanguageOption { english, netherlands }

extension LanguageOptionExt on LanguageOption {
  String get label {
    switch (this) {
      case LanguageOption.english:
        return '🇬🇧 English';
      case LanguageOption.netherlands:
        return '🇳🇱 Nederlands';
    }
  }

  AppLocale get appLocale {
    switch (this) {
      case LanguageOption.english:
        return AppLocale.en;
      case LanguageOption.netherlands:
        return AppLocale.nl;
    }
  }
}
