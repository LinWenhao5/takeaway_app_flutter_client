import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/presentation/available_time_modal.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

class OrderReserveTimeInfo extends ConsumerWidget {
  final String reserveTime;
  final OrderType orderType;
  final void Function(String newTime)? onTimeChanged;
  final bool canEdit;

  const OrderReserveTimeInfo({
    required this.reserveTime,
    required this.orderType,
    this.onTimeChanged,
    this.canEdit = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final needChange = ref.watch(orderRepayProvider).needChangeReserveTime;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
            const SizedBox(width: 8),
            if (canEdit)
              IconButton(
                icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.primary),
                tooltip: context.t.orderDetails.changeReserveTime,
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) => AvailableTimeModal(
                      selectedTime: reserveTime,
                      orderType: orderType,
                      onChanged: (time) {
                        if (time != null && onTimeChanged != null) {
                          onTimeChanged!(time);
                        }
                      },
                    ),
                  );
                },
              ),
          ],
        ),
        if (needChange) ...[
          const SizedBox(height: 4),
          Text(
            context.t.orderDetails.reserveTimeNeedChange,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}
