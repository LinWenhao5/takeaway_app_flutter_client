import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/language_swicher.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/application/navigation_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/presentation/main_nav_bar.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/domain/pages_list.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.homepage.hello),
        actions: [
          LanguageSwitcher(),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to the cart page
              Navigator.pushNamed(context, '/cart');
            },
          ),
          IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              // Navigate to the login page
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
      body: pagesList[currentIndex],
      bottomNavigationBar: const MainNavBar(),
    );
  }
}