import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderReserveTimeInfo extends StatelessWidget {
  final String reserveTime;
  const OrderReserveTimeInfo({required this.reserveTime, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time,
          size: 20,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        const SizedBox(width: 8),
        Text(
          context.t.orderDetails.reserveTime,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        Text(
          reserveTime,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
