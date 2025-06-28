import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/no_result_widget.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/search_error_widget.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_tile.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart'; 

class ProductSearchResult extends ConsumerWidget {
  const ProductSearchResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyword = ref.watch(searchKeywordProvider);
    final searchResult = ref.watch(productSearchProvider);

    if (keyword.isEmpty) {
      return const SizedBox.shrink();
    }

    return searchResult.when(
      data: (products) => products.isEmpty
          ? const NoResultWidget()
          : SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(kCardRadius),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductTile(product: product);
                  },
                ),
              ),
            ),
      loading: () => Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: SpinKitFadingCircle(
            color: Theme.of(context).primaryColor,
            size: 40.0,
          ),
        ),
      ),
      error: (error, stackTrace) => SearchErrorWidget(),
    );
  }
}