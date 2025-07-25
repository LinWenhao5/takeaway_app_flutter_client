import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

class OrderTypeSelector extends StatelessWidget {
  final OrderType selectedType;
  final ValueChanged<OrderType> onChanged;

  const OrderTypeSelector({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = [
      selectedType == OrderType.delivery,
      selectedType == OrderType.pickup,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 280,
            maxWidth: 400,
            minHeight: 36,
            maxHeight: 44,
          ),
          child: ToggleButtons(
            borderRadius: BorderRadius.circular(24),
            isSelected: isSelected,
            onPressed: (index) {
              if (index == 0) {
                onChanged(OrderType.delivery);
              } else {
                onChanged(OrderType.pickup);
              }
            },
            selectedColor: colorScheme.onPrimary,
            color: colorScheme.onSurface,
            fillColor: colorScheme.primary,
            borderColor: colorScheme.primary,
            selectedBorderColor: colorScheme.primary,
            constraints: const BoxConstraints(
              minWidth: 140,
              minHeight: 36,
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Text(context.t.orderType.delivery, style: TextStyle(fontSize: 16)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Text(context.t.orderType.pickup, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}