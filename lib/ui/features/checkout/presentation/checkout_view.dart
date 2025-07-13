import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/address_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/checkout_item_list.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/address_selector.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/submit_order_button.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/payment_method_selector.dart';

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

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CheckoutItemList(),
              const SizedBox(height: 32),
              const AddressSelector(),
              const SizedBox(height: 32),
              const PaymentMethodSelector(),
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
              SubmitOrderButton(
                enabled: addresses.isNotEmpty && activeAddressId != null,
                activeAddressId: activeAddressId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}