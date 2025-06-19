import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';

class CartSummary extends StatelessWidget {
  final String totalQuantity;
  final String totalPrice;

  const CartSummary({
    super.key,
    required this.totalQuantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Quantity: $totalQuantity',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          'Total Price: €$totalPrice',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color:kPrimaryColor,
          ),
        ),
      ],
    );
  }
}