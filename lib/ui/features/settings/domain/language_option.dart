import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

enum LanguageOption {
  english,
  chinese,
}

extension LanguageOptionExt on LanguageOption {
  String get label {
    switch (this) {
      case LanguageOption.english:
        return 'English';
      case LanguageOption.chinese:
        return '中文';
    }
  }

  AppLocale get appLocale {
    switch (this) {
      case LanguageOption.english:
        return AppLocale.en;
      case LanguageOption.chinese:
        return AppLocale.zh;
    }
  }
}