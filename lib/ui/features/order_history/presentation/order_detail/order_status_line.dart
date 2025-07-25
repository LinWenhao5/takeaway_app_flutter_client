import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/utils/order_status_ultils.dart';

class OrderStatusLine extends StatelessWidget {
  final String status;
  const OrderStatusLine({required this.status, super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      {'key': 'unpaid', 'label': context.t.orderStatus.unpaid},
      {'key': 'paid', 'label': context.t.orderStatus.paid},
      {'key': 'delivering', 'label': context.t.orderStatus.delivering},
      {'key': 'completed', 'label': context.t.orderStatus.completed},
    ];
    int currentIndex = steps.indexWhere((s) => s['key'] == status);
    if (currentIndex == -1) currentIndex = 0;

    return Column(
      children: [
        StepProgressIndicator(
          totalSteps: steps.length,
          currentStep: currentIndex + 1,
          size: 6,
          padding: 0,
          selectedColor: OrderStatusUtils.getStatusColor(status),
          unselectedColor: Colors.grey[300]!,
          roundedEdges: Radius.circular(4),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps.map((s) {
            final idx = steps.indexOf(s);
            final isActive = idx == currentIndex;
            final color = isActive
                ? OrderStatusUtils.getStatusColor(s['key'] as String)
                : Theme.of(context).dividerColor;
            return Expanded(
              child: Column(
                children: [
                  Icon(
                    OrderStatusUtils.getOrderStatusIcon(s['key'] as String),
                    color: color,
                    size: 22,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    s['label'] as String,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: color,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}