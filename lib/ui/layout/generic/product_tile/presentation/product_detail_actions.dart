import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/provider.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class ProductDetailActions extends ConsumerWidget {
  final Product product;
  const ProductDetailActions({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addToCartNotifier = ref.read(addToCartProvider(product.id).notifier);
    final addToCartState = ref.watch(addToCartProvider(product.id));
    final quantity = ref.watch(quantityProvider(product.id));
    final quantityNotifier = ref.read(quantityProvider(product.id).notifier);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: quantityNotifier.decrement,
              ),
              Text('$quantity', style: Theme.of(context).textTheme.bodyMedium),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: quantityNotifier.increment,
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 44,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
              elevation: 0,
            ),
            icon: addToCartState.isLoading
                ? SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  )
                : const Icon(Icons.add, size: 22),
            label: Text(
              context.t.search.addToCart,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
            onPressed: addToCartState.isLoading
                ? null
                : () async {
                    final scaffoldMessenger = ScaffoldMessenger.of(context);

                    await addToCartNotifier.addToCart(product.id, quantity);

                    final updatedAddToCartState = ref.read(
                      addToCartProvider(product.id),
                    );

                    if (updatedAddToCartState.isSuccess) {
                      quantityNotifier.reset();
                      await ref.read(fetchCartProvider.notifier).fetchCart();
                      Navigator.of(context).pop();
                    } else if (updatedAddToCartState.errorMessage != null) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          content: Text(updatedAddToCartState.errorMessage!),
                        ),
                      );
                    }
                  },
          ),
        ),
      ],
    );
  }
}