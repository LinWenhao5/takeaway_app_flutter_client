import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/presentation/cart_buttom_bar.dart';
import 'cart_item_card/cart_item_card.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchCartNotifier = ref.read(fetchCartProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(cartItemsProvider).isEmpty && !ref.read(fetchCartProvider).isLoading) {
        fetchCartNotifier.fetchCart();
      }
    });

    return RefreshIndicator(
      onRefresh: () async {
        fetchCartNotifier.fetchCart();
      },
      child: Consumer(
        builder: (context, ref, _) {
          final cartItems = ref.watch(cartItemsProvider);
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.t.cart.emptyCartMessage,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.t.cart.addItemsMessage,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return CartItemCard(item: item);
                      },
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: CartBottomBar(),
              ),
            ],
          );
        },
      ),
    );
  }
}