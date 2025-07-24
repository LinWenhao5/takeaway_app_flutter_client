import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderAddressInfo extends StatelessWidget {
  final dynamic address;
  const OrderAddressInfo({required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: theme.colorScheme.primary, size: 22),
              const SizedBox(width: 8),
              Text(
                context.t.orderHistory.deliveryAddress,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '${address.name}  ${address.phone}',
            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            '${address.street} ${address.houseNumber}, ${address.city}',
            style: theme.textTheme.bodySmall,
          ),
          Text(
            '${address.country}, ${address.postcode}',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}