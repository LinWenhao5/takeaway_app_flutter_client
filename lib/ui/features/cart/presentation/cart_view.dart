import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'cart_item_card.dart';
import 'cart_summary.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(fetchCartProvider);
    final fetchCartNotifier = ref.read(fetchCartProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (cartState.getCartResponse == null && !cartState.isLoading && cartState.errorMessage == null) {
        fetchCartNotifier.fetchCart(context);
      }
    });

    return RefreshIndicator(
      onRefresh: () async {
        fetchCartNotifier.fetchCart(context);
      },
      child: Builder(
        builder: (context) {
          if (cartState.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (cartState.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    cartState.errorMessage!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      fetchCartNotifier.fetchCart(context);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (cartState.getCartResponse == null || cartState.getCartResponse!.cart.isEmpty) {
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
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add items to your cart to see them here.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          final cartResponse = cartState.getCartResponse!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartResponse.cart.length,
                  itemBuilder: (context, index) {
                    final item = cartResponse.cart[index];
                    return CartItemCard(item: item);
                  },
                ),
              ),
              const Divider(),
              CartSummary(
                totalQuantity: cartResponse.totalQuantity,
                totalPrice: cartResponse.totalPrice,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 结算逻辑
                  },
                  child: const Text(
                    'Proceed to Checkout',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}