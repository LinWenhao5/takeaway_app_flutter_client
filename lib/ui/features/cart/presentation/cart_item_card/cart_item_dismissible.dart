import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/domain/cart_item.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';

class CartItemDismissible extends ConsumerWidget {
  final CartItem item;
  final Widget child;
  const CartItemDismissible({
    super.key,
    required this.item,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleteCartNotifier = ref.read(
      deleteCartItemProvider(item.id).notifier,
    );

    return Dismissible(
      key: ValueKey(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(kCardRadius),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 8),
            Text(
              context.t.cart.swipeToDelete,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
      onDismissed: (direction) async {
        await deleteCartNotifier.deleteCartItem(item.id);
        ref.read(cartItemsProvider.notifier).removeItem(item.id);

        final updatedItems = ref.read(cartItemsProvider);
        final totalQuantity = updatedItems.fold(
          0,
          (sum, item) => sum + int.parse(item.quantity),
        );
        final totalPrice = updatedItems.fold(
          0.0,
          (sum, item) =>
              sum + double.parse(item.price) * int.parse(item.quantity),
        );
        ref
            .read(cartSummaryProvider.notifier)
            .updateSummary(
              totalQuantity.toString(),
              totalPrice.toStringAsFixed(2),
            );
      },
      child: child,
    );
  }
}
