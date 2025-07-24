import 'package:flutter/material.dart';

class OrderPriceInfo extends StatelessWidget {
  final String totalPrice;
  const OrderPriceInfo({required this.totalPrice, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(Icons.attach_money, color: theme.colorScheme.primary),
        const SizedBox(width: 4),
        Text('Total Price', style: theme.textTheme.titleMedium),
        const Spacer(),
        Text(
          '€$totalPrice',
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}