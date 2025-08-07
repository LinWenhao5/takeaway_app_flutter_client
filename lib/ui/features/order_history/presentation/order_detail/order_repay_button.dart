import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/utils/launch_util.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class RepayButton extends ConsumerWidget {
  final int orderId;

  const RepayButton({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () async {
        final notifier = ref.read(orderRepayProvider.notifier);
        await notifier.repayOrder(orderId.toString());
        final repayState = ref.read(orderRepayProvider);
        final paymentUrl = repayState.data?.paymentUrl;
        if (paymentUrl != null && paymentUrl.isNotEmpty) {
          await openWebUrl(paymentUrl);
          if (context.mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/manual-payment',
              ModalRoute.withName('/'),
              arguments: paymentUrl,
            );
          }
        } else if (repayState.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(repayState.error!)),
          );
        }
      },
      icon: const Icon(Icons.payment),
      label: Text(context.t.payment.payNow),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }
}