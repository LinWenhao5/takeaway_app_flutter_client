import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/address_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/checkout_item_list.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/address_selector.dart';

class CheckoutView extends ConsumerWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchCartNotifier = ref.read(fetchCartProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(cartItemsProvider).isEmpty && !ref.read(fetchCartProvider).isLoading) {
        fetchCartNotifier.fetchCart();
      }
    });

    final cartSummary = ref.watch(cartSummaryProvider);
    final activeAddressId = ref.watch(selectedAddressIdProvider);
    final addresses = ref.watch(addressNotifierProvider).addresses;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckoutItemList(),
          const SizedBox(height: 32),
          const AddressSelector(),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.t.checkout.subtotal, style: Theme.of(context).textTheme.titleMedium),
              Text(
                '€${cartSummary.totalPrice}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: addresses.isNotEmpty && activeAddressId != null
                  ? () async {
                      await ref.read(orderNotifierProvider.notifier).createOrder(activeAddressId);
                      final orderState = ref.read(orderNotifierProvider);
                      if (orderState.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.t.checkout.orderSuccess)),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(context.t.checkout.orderFailed)),
                        );
                      }
                    }
                  : null,
              child: Text(context.t.checkout.submitOrder),
            ),
          ),
        ],
      ),
    );
  }
}