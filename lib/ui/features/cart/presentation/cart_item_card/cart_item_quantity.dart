import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';

class CartItemQuantity extends ConsumerWidget {
  final CartItem item;
  const CartItemQuantity({super.key, required this.item});

  void _updateLocalCartAndSummary(WidgetRef ref, int productId, int newQuantity) {
    ref.read(cartItemsProvider.notifier).setItems(
      ref.read(cartItemsProvider).map((cartItem) {
        if (cartItem.id == productId) {
          final newSubtotal = (double.parse(cartItem.price) * newQuantity).toStringAsFixed(2);
          return cartItem.copyWith(
            quantity: newQuantity.toString(),
            subtotal: newSubtotal,
          );
        }
        return cartItem;
      }).toList(),
    );
    _updateSummary(ref);
  }

  void _removeLocalCartAndSummary(WidgetRef ref, int productId) {
    ref.read(cartItemsProvider.notifier).removeItem(productId);
    _updateSummary(ref);
  }

  void _updateSummary(WidgetRef ref) {
    final updatedItems = ref.read(cartItemsProvider);
    final totalQuantity = updatedItems.fold(0, (sum, item) => sum + int.parse(item.quantity));
    final totalPrice = updatedItems.fold(0.0, (sum, item) => sum + double.parse(item.price) * int.parse(item.quantity));
    ref.read(cartSummaryProvider.notifier).updateSummary(
      totalQuantity.toString(),
      totalPrice.toStringAsFixed(2),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Subtotal amount
        Text(
          '€${item.subtotal}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        // Quantity adjustment buttons
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () async {
                final currentQuantity = int.parse(item.quantity);
                if (currentQuantity > 1) {
                  await ref.read(deleteCartItemProvider(item.id).notifier)
                      .deleteCartItemQuantity(item.id, 1);
                  _updateLocalCartAndSummary(ref, item.id, currentQuantity - 1);
                } else {
                  await ref.read(deleteCartItemProvider(item.id).notifier)
                      .deleteCartItem(item.id);
                  _removeLocalCartAndSummary(ref, item.id);
                }
              },
            ),
            Text(
              item.quantity,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () async {
                final currentQuantity = int.parse(item.quantity);
                await ref.read(addToCartProvider(item.id).notifier)
                    .addToCart(item.id, 1);
                _updateLocalCartAndSummary(ref, item.id, currentQuantity + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}