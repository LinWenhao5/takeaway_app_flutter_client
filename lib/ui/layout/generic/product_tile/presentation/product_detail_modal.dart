import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_detail_actions.dart';

class ProductDetailModal extends ConsumerWidget {
  final Product product;
  const ProductDetailModal({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(productDetailPageProvider);
    final pageController = PageController(initialPage: currentPage);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (product.media.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView.builder(
                  controller: pageController,
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  itemCount: product.media.length,
                  onPageChanged: (index) {
                    ref.read(productDetailPageProvider.notifier).state = index;
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      product.media[index].path,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            )
          else
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          if (product.media.length > 1)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  product.media.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentPage == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 8),
          Text(
            product.name,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 240,
            child: SingleChildScrollView(
              child: Html(
                data: product.description,
                style: {
                  "body": Style(
                    margin: Margins.zero,
                    fontSize: FontSize(Theme.of(context).textTheme.bodyMedium?.fontSize ?? 16),
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                },
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '€${product.price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          ProductDetailActions(product: product),
        ],
      ),
    );
  }
}