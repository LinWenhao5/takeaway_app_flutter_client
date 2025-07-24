import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/application/navigation_provider.dart';

class MainNavBar extends ConsumerWidget {
  const MainNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.restaurant),
          label: context.t.navbar.order,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history),
          label: context.t.navbar.orderHistory,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_outlined),
          label: context.t.navbar.profile,
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        ref.read(navIndexProvider.notifier).state = index;
      },
    );
  }
}