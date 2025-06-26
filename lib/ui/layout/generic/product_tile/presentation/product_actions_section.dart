import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/domain/product.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ProductActionsSection extends ConsumerWidget {
  final Product product;

  const ProductActionsSection({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addToCartNotifier = ref.read(addToCartProvider(product.id).notifier);
    final addToCartState = ref.watch(addToCartProvider(product.id));

    final quantity = ref.watch(quantityProvider(product.id));
    final quantityNotifier = ref.read(quantityProvider(product.id).notifier);

    ref.listen(
      addToCartProvider(product.id),
      (previous, next) async {
        final scaffoldMessenger = ScaffoldMessenger.of(context);

        if (next.isSuccess && next.isLoading == false) {
          quantityNotifier.reset();
          await ref.read(fetchCartProvider.notifier).fetchCart(context);
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(
                context.t.cart.addedToCart.replaceAll('{productName}', product.name),
              ),
              duration: const Duration(milliseconds: 500),
            ),
          );
        } else if (next.errorMessage != null && next.isLoading == false) {
          scaffoldMessenger.showSnackBar(
            SnackBar(
              content: Text(next.errorMessage!),
            ),
          );
        }
      },
    );

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
          icon: addToCartState.isLoading
              ? SizedBox(
                  width: 22,
                  height: 22,
                  child: SpinKitFadingCircle(
                    size: 22,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : Icon(Icons.shopping_cart_outlined, size: 22, color: Theme.of(context).primaryColor),
          tooltip: context.t.search.addToCart,
          onPressed: addToCartState.isLoading
              ? null
              : () async {
                  await addToCartNotifier.addToCart(
                    context,
                    product.id,
                    quantity,
                  );
                },
        ),
      ],
    );
  }
}