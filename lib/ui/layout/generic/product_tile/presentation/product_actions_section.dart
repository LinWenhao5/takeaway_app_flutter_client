import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/quantity_notifier.dart';

class ProductActionsSection extends StatelessWidget {
  final Product product;
  final int quantity;
  final QuantityNotifier quantityNotifier;
  final WidgetRef ref;

  const ProductActionsSection({
    super.key,
    required this.product,
    required this.quantity,
    required this.quantityNotifier,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}