import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/image/product_image.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/padding.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ProductTile extends StatelessWidget {
  final dynamic product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(kListTileRadius),
        child: product.media.isNotEmpty
            ? ProductImage(media: product.media)
            : const Icon(Icons.image_not_supported),
      ),
      title: Text(
        product.name,
        style: appTextTheme.titleMedium,
      ),
      subtitle: Text(
        product.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: appTextTheme.bodySmall,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '€${product.price}',
            style: appTextTheme.titleMedium,
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, size: 22, color: kPrimaryColor),
            tooltip: t.search.addToCart,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${product.name} ${context.t.cart.addedToCart}')),
              );
            },
          ),
        ],
      ),
      contentPadding: kListTilePadding,
    );
  }
}