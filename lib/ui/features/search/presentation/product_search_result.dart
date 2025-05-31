import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_result_tile.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

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
          ? Center(
              child: Text(
                t.search.noResult,
                style: appTextTheme.bodyLarge,
              ),
            )
          : Container(
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
                  return ProductResultTile(product: product);
                },
              ),
            ),
      loading: () => const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator(
          color: kPrimaryColor,
        )),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.wifi_off, color: kErrorColor, size: 48),
              const SizedBox(height: 16),
              Text(
                context.t.search.loadFailed,
                style: appTextTheme.bodyLarge
              )
            ],
          )
        ),
      ),
    );
  }
}