import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/main_app.dart';


Future<void> main() async {
  runApp(
    ProviderScope(
      child: TranslationProvider(child: TakeawayApp()),
    ),
  );
}