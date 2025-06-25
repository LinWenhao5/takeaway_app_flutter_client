import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cart_item_details.dart';
import 'cart_item_quantity.dart';
import 'cart_item_dismissible.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';

class CartItemCard extends ConsumerWidget {
  final CartItem item;
  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CartItemDismissible(
      item: item,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product details
              Expanded(child: CartItemDetails(item: item)),
              const SizedBox(width: 12),
              // Quantity adjustment
              CartItemQuantity(item: item),
            ],
          ),
        ),
      ),
    );
  }
}