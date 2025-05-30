import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateProvider<AppLocale>((ref) => AppLocale.en);