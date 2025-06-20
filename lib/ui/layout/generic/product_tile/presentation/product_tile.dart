import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/padding.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_actions_section.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_details_section.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_image_section.dart';

class ProductTile extends ConsumerWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityProvider(product.id));
    final quantityNotifier = ref.read(quantityProvider(product.id).notifier);

    return Padding(
      padding: kListTilePadding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageSection(product: product),
          const SizedBox(width: 12),
          Expanded(
            child: ProductDetailsSection(product: product),
          ),
          ProductActionsSection(
            product: product,
            quantity: quantity,
            quantityNotifier: quantityNotifier
          ),
        ],
      ),
    );
  }
}