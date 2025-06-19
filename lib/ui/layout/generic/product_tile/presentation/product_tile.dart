import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/image/product_image.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/padding.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/add_to_cart_provider.dart';

class ProductTile extends ConsumerWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(kListTileRadius),
        child: product.media.isNotEmpty
            ? ProductImage(media: product.media)
            : const Icon(Icons.image_not_supported),
      ),
      title: Text(
        product.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        product.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '€${product.price}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, size: 22, color: Theme.of(context).primaryColor),
            tooltip: t.search.addToCart,
            onPressed: () async {
              final scaffoldMessenger = ScaffoldMessenger.of(context);
              try {
                await ref.read(addToCartProvider({
                  'productId': product.id,
                  'quantity': 1,
                  'context': context,
                }).future);

                if (!context.mounted) return;

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
      contentPadding: kListTilePadding,
    );
  }
}