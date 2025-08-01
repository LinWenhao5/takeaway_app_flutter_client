import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';

class CartItemDetails extends StatelessWidget {
  final CartItem item;
  const CartItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product name
        Text(
          item.name,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        // Product description
        Text(
          item.description,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        // Product price
        Text('€${item.price}', style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
