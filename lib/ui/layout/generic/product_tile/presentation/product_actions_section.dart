import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/quantity_notifier.dart';

class ProductActionsSection extends ConsumerWidget {
  final Product product; // The product being displayed
  final int quantity; // The current quantity selected by the user
  final QuantityNotifier quantityNotifier; // Notifier to manage quantity changes

  const ProductActionsSection({
    super.key,
    required this.product,
    required this.quantity,
    required this.quantityNotifier,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the state of addToCartProvider to handle loading and error states
    final addToCartState = ref.watch(addToCartProvider);
    final addToCartNotifier = ref.read(addToCartProvider.notifier);

    return Column(
      children: [
        Row(
          children: [
            // Button to decrement the quantity
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: quantityNotifier.decrement,
            ),
            // Display the current quantity
            Text(
              '$quantity',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            // Button to increment the quantity
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: quantityNotifier.increment,
            ),
          ],
        ),
        // Button to add the product to the cart
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined, size: 22, color: Theme.of(context).primaryColor),
          tooltip: context.t.search.addToCart, // Tooltip for accessibility
          onPressed: addToCartState.isLoading
              ? null
              : () async {
                  final scaffoldMessenger = ScaffoldMessenger.of(context);

                  // Add the product to the cart
                  await addToCartNotifier.addToCart(
                    context,
                    product.id,
                    quantity,
                  );

                  // Check if the context is still valid
                  if (!context.mounted) return;

                  // Get the updated state
                  final updatedAddToCartState = ref.read(addToCartProvider);

                  // Show a success or error message based on the result
                  if (updatedAddToCartState.isSuccess) {
                    // Reset the quantity after adding to the cart
                    quantityNotifier.reset();

                    // Refresh the cart data
                    await ref.read(fetchCartProvider.notifier).fetchCart(context);

                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(
                          context.t.cart.addedToCart.replaceAll('{productName}', product.name),
                        ),
                      ),
                    );
                  } else if (updatedAddToCartState.errorMessage != null) {
                    scaffoldMessenger.showSnackBar(
                      SnackBar(
                        content: Text(updatedAddToCartState.errorMessage!)
                      ),
                    );
                  }
                },
        ),
      ],
    );
  }
}