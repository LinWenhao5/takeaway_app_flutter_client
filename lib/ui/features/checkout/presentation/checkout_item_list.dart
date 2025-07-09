import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';

class CheckoutItemList extends ConsumerWidget {
  const CheckoutItemList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartItemsProvider);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length + 1,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        if (index == 0) {
          // Title
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(context.t.checkout.orderItems, style: Theme.of(context).textTheme.titleMedium),
          );
        } else {
          final item = cartItems[index - 1];
          return ListTile(
            title: Text(item.name),
            trailing: Text('€${item.price}'),
            subtitle: Text('${context.t.checkout.amount}: ${item.quantity}'),
            dense: true,
          );
        }
      },
    );
  }
}