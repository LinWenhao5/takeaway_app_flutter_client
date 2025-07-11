import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SubmitOrderButton extends ConsumerWidget {
  final bool enabled;
  final int? activeAddressId;

  const SubmitOrderButton({
    super.key,
    required this.enabled,
    required this.activeAddressId,
  });

  Future<void> _handleSubmit(BuildContext context, WidgetRef ref) async {
    await ref.read(orderNotifierProvider.notifier).createOrder(activeAddressId!);
    final orderState = ref.read(orderNotifierProvider);
    if (orderState.success) {
      final url = orderState.paymentUrl;
      if (url != null && url.isNotEmpty) {
        final uri = Uri.parse(url);
        try {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${context.t.checkout.cannotOpenPaymentPage}\n$url')),
          );
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.checkout.orderSuccess)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.checkout.orderFailed)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled && activeAddressId != null
            ? () => _handleSubmit(context, ref)
            : null,
        child: Text(context.t.checkout.submitOrder),
      ),
    );
  }
}