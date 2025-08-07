import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/utils/launch_util.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitOrderButton extends ConsumerWidget {
  final bool enabled;
  final int? activeAddressId;
  final OrderType orderType;
  final String reserveTime;

  const SubmitOrderButton({
    super.key,
    required this.enabled,
    required this.activeAddressId,
    required this.orderType,
    required this.reserveTime,
  });

  Future<void> _handleSubmit(BuildContext context, WidgetRef ref) async {
    await ref
        .read(orderNotifierProvider.notifier)
        .createOrder(
          orderType: orderType,
          addressId: orderType == OrderType.delivery ? activeAddressId : null,
          reserveTime: reserveTime,
        );
    final orderState = ref.read(orderNotifierProvider);
    if (orderState.success) {
      final url = orderState.paymentUrl;
      if (url != null && url.isNotEmpty) {
        await openWebUrl(url);
        if (context.mounted) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/manual-payment',
            ModalRoute.withName('/'),
            arguments: url,
          );
        }
      }
      ref.read(cartItemsProvider.notifier).setItems([]);
      ref.read(cartSummaryProvider.notifier).updateSummary("0", "0.00");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(context.t.checkout.orderSuccess)));
    } 
    
    if (orderState.error != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(orderState.error!)));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed:
            enabled &&
                    (orderType == OrderType.pickup || activeAddressId != null)
                ? () => _handleSubmit(context, ref)
                : null,
        child: Text(context.t.checkout.submitOrder),
      ),
    );
  }
}
