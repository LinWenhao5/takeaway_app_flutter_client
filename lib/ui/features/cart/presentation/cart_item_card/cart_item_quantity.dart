import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';

class CartItemQuantity extends StatelessWidget {
  final CartItem item;
  const CartItemQuantity({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                // Logic to decrease quantity
              },
            ),
            Text(
              item.quantity.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {
                // Logic to increase quantity
              },
            ),
          ],
        ),
      ],
    );
  }
}