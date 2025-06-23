import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
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
          '${context.t.cart.totalQuantity}: $totalQuantity',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          '${context.t.cart.totalPrice}: €$totalPrice',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color:kPrimaryColor,
          ),
        ),
      ],
    );
  }
}