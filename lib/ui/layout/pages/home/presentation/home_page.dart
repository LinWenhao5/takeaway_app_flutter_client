import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/application/category_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/presentation/product_tab_view.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_search.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryAsync = ref.watch(categoryWithProductsProvider);

    return Column(
      children: [
        const ProductSearch(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () {
              return ref.refresh(categoryWithProductsProvider.future);
            },
            child: categoryAsync.when(
              data: (categories) => CategoryTabView(categories: categories),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, stack) => Center(child: Text(e.toString())),
            ),
          ),
        ),
      ],
    );
  }
}