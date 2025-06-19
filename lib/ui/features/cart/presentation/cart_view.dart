import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'cart_item_card.dart';
import 'cart_summary.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartAsyncValue = ref.watch(cartProvider);

    return cartAsyncValue.when(
      data: (cartResponse) {
        if (cartResponse.cart.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }

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
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(
        child: Text('Failed to load cart: $error'),
      ),
    );
  }
}