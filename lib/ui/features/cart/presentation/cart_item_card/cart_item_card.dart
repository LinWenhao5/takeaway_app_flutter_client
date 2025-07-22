import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
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
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(kCardRadius),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: CartItemDetails(item: item)),
              const SizedBox(width: 16),
              CartItemQuantity(item: item),
            ],
          ),
        ),
      ),
    );
  }
}