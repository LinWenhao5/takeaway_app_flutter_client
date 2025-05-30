import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/image/product_image.dart';
import 'package:takeaway_app_flutter_client/theme/preset/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/text_theme.dart';

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
                '没有搜索结果',
                style: appTextTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: kAccentColor.withOpacity(0.07),
                  thickness: 1,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: product.media.isNotEmpty
                          ? ProductImage(media: product.media)
                          : const Icon(Icons.image_not_supported, size: 40, color: kAccentColor),
                    ),
                    title: Text(
                      product.name,
                      style: appTextTheme.titleMedium?.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: appTextTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Text(
                      '￥${product.price}',
                      style: appTextTheme.titleMedium?.copyWith(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 12),
                    shape: Border(
                      bottom: BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                  );
                },
              ),
            ),
      loading: () => const Padding(
        padding: EdgeInsets.all(32),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            '加载失败: $e',
            style: appTextTheme.bodyMedium?.copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }
}