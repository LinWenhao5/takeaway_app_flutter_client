import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/theme/theme.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/language_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/theme_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/presentation/main_scaffold.dart';
import 'package:takeaway_app_flutter_client/app_routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class TakeawayApp extends ConsumerWidget {
  const TakeawayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    ref.read(localeProvider.notifier).load();

    return DismissKeyboard(
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        home: const MainScaffold(),
        routes: appRoutes,
      ),
    );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: child,
    );
  }
}