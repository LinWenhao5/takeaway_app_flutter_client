import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_card.dart';

class OrderSection extends StatelessWidget {
  final String title;
  final List<Order> orders;

  const OrderSection({
    required this.title,
    required this.orders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) return SizedBox.shrink();
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ...orders.map((order) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OrderCard(order: order),
            )),
          ],
        ),
      ),
    );
  }
}