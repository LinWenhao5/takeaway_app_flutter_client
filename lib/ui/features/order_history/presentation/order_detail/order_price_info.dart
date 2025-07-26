import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderPriceInfo extends StatelessWidget {
  final String totalPrice;
  const OrderPriceInfo({required this.totalPrice, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.attach_money, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(context.t.orderDetails.totalPrice, style: Theme.of(context).textTheme.titleMedium),
        const Spacer(),
        Text(
          '€$totalPrice',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}