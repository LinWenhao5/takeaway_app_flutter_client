import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';
import '../../available_time/presentation/available_time_modal.dart';

class AvailableTimeSelector extends ConsumerWidget {
  final String? selectedTime;
  final ValueChanged<String?> onChanged;

  const AvailableTimeSelector({
    super.key,
    required this.selectedTime,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return AvailableTimeModal(
              selectedTime: selectedTime,
              onChanged: onChanged,
              orderType: ref.watch(selectedOrderTypeProvider),
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.t.checkout.reserveTimeTitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: context.t.checkout.selectTimeHint,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              prefixIcon: Icon(
                Icons.access_time,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            child: Text(
              selectedTime != null
                  ? DateTimeUtil.formatReserveTimeHuman(selectedTime!)
                  : context.t.checkout.selectTimeHint,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
