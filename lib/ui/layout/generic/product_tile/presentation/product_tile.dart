import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/image/product_image.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/padding.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';

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
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(kListTileRadius),
            child: product.media.isNotEmpty
                ? ProductImage(media: product.media)
                : const Icon(Icons.image_not_supported, size: 48),
          ),
          const SizedBox(width: 12),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  product.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 8),
                Text(
                  '€${product.price}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          // Quantity and Actions
          Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: quantityNotifier.decrement,
                  ),
                  Text(
                    '$quantity',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: quantityNotifier.increment,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, size: 22, color: Theme.of(context).primaryColor),
                tooltip: t.search.addToCart,
                onPressed: () async {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);
                  try {
                    await ref.read(addToCartProvider({
                      'productId': product.id,
                      'quantity': quantity,
                      'context': context,
                    }).future);

                    if (!context.mounted) return;

                    quantityNotifier.reset();

                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          context.t.cart.addedToCart.replaceAll('{productName}', product.name),
                        ),
                      ),
                    );
                  } catch (e) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(content: Text(e.toString())),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}