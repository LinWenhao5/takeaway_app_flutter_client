import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/theme/theme.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/add_address_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/edit_address_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/language_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/application/theme_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/address_management_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/login_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/register_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/cart/cart_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/checkout/checkout_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/presentation/main_scaffold.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/account/account_settings_page.dart';

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
        routes: {
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/account_settings': (context) => const AccountSettingsPage(),
          '/address_management': (context) => const AddressManagementPage(),
          '/add_address': (context) => const AddAddressPage(),
          '/edit_address': (context) {
            final args = ModalRoute.of(context)!.settings.arguments;
            return EditAddressPage(address: args as Address);
          },
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