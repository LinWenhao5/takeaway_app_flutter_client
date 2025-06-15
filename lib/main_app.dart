import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/theme/theme.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/login_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/register_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/presentation/main_scaffold.dart';

class TakeawayApp extends ConsumerWidget {
  const TakeawayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DismissKeyboard(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const MainScaffold(),
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
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