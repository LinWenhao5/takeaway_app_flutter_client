import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/application/navigation_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/navbar/presentation/main_nav_bar.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/domain/pages_list.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navIndexProvider);
    final config = pagesConfigList[currentIndex];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(config.titleBuilder(context)),
      ),
      body: config.page,
      bottomNavigationBar: const MainNavBar(),
    );
  }
}