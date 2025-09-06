import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/address_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/available_time_selector.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/checkout_item_list.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/address_selector.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/order_type_selector.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/submit_order_button.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/presentation/payment_method_selector.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/presentation/store_info_checkout_widget.dart';

class CheckoutView extends ConsumerStatefulWidget {
  const CheckoutView({super.key});

  @override
  ConsumerState<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends ConsumerState<CheckoutView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(deliverySettingNotifierProvider.notifier).fetch();
      ref.read(fetchCartProvider.notifier).fetchCart();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fetchCartNotifier = ref.read(fetchCartProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (ref.read(cartItemsProvider).isEmpty &&
          !ref.read(fetchCartProvider).isLoading) {
        fetchCartNotifier.fetchCart();
      }
    });

    final cartSummary = ref.watch(cartSummaryProvider);
    final activeAddressId = ref.watch(selectedAddressIdProvider);
    final addresses = ref.watch(addressNotifierProvider).addresses;
    final orderType = ref.watch(selectedOrderTypeProvider);
    final selectedTime = ref.watch(selectedReserveTimeProvider);
    final note = ref.read(checkoutNoteProvider);

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          children: [
            OrderTypeSelector(
              selectedType: orderType,
              onChanged: (type) {
                ref.read(selectedOrderTypeProvider.notifier).state = type;
                ref.read(selectedReserveTimeProvider.notifier).state = null;
              },
            ),
            Expanded(
              child: CheckoutContent(
                orderType: orderType,
                addresses: addresses,
                activeAddressId: activeAddressId,
                cartSummary: cartSummary,
                selectedTime: selectedTime,
                onTimeChanged: (time) {
                  ref.read(selectedReserveTimeProvider.notifier).state = time;
                },
                note: note,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckoutContent extends ConsumerWidget {
  final OrderType orderType;
  final List addresses;
  final int? activeAddressId;
  final dynamic cartSummary;
  final String? selectedTime;
  final ValueChanged<String?> onTimeChanged;
  final String? note;

  const CheckoutContent({
    super.key,
    required this.orderType,
    required this.addresses,
    required this.activeAddressId,
    required this.cartSummary,
    required this.selectedTime,
    required this.onTimeChanged,
    this.note,
  });

  @override 
  Widget build(BuildContext context, WidgetRef ref) {
    final deliverySettingState = ref.watch(deliverySettingNotifierProvider);
    final minimumAmount = deliverySettingState.setting?.minimumAmount ?? 0.0;
    final cartTotal = double.tryParse(cartSummary.totalPrice) ?? 0.0;

    bool belowMinimum = false;
    if (orderType == OrderType.delivery) {
      belowMinimum = cartTotal < minimumAmount;
    }
    return RefreshIndicator(
      onRefresh: () async {
        final fetchCartNotifier = ref.read(fetchCartProvider.notifier);
        await fetchCartNotifier.fetchCart();
        ref.invalidate(availableTimesProvider);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CheckoutItemList(),
              const SizedBox(height: 32),
              if (orderType == OrderType.delivery) ...[
                const AddressSelector(),
                const SizedBox(height: 32),
              ],  
              if (orderType == OrderType.pickup) ...[
                const StoreInfoCheckoutWidget(),
                const SizedBox(height: 32),
              ],
              AvailableTimeSelector(
                selectedTime: selectedTime,
                onChanged: onTimeChanged,
              ),
              const SizedBox(height: 32),
              const PaymentMethodSelector(),
              const SizedBox(height: 24),
              if (orderType == OrderType.delivery && belowMinimum)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '${context.t.checkout.minimumAmountError}: €${minimumAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              SubmitOrderButton(
                enabled:
                    (selectedTime != null) &&
                    (orderType == OrderType.pickup ||
                    (addresses.isNotEmpty && activeAddressId != null)) &&
                    !belowMinimum,
                activeAddressId:
                    orderType == OrderType.delivery ? activeAddressId : null,
                orderType: orderType,
                reserveTime: selectedTime ?? '',
                note: note ?? '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
