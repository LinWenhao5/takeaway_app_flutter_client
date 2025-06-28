import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/application/navigation_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/presentation/main_nav_bar.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/domain/pages_list.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);
    final config = pagesConfigList[currentIndex];
    final cartSummary = ref.watch(cartSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(config.titleBuilder(context)),
        actions: [
          badges.Badge(
            showBadge: cartSummary.totalQuantity != "0",
            badgeContent: Text(
              cartSummary.totalQuantity,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.red,
              padding: EdgeInsets.all(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: config.page,
      bottomNavigationBar: const MainNavBar(),
    );
  }
}