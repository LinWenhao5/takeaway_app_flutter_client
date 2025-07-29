import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

class AvailableTimeSelector extends ConsumerWidget {
  final OrderType orderType;
  final String? selectedTime;
  final ValueChanged<String?> onChanged;

  const AvailableTimeSelector({
    super.key,
    required this.orderType,
    required this.selectedTime,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncTimes = ref.watch(availableTimesProvider(orderType));

    return asyncTimes.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text('Failed to load available times: $err', style: TextStyle(color: Colors.red)),
      ),
      data: (response) {
        if (response.times.isEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text('No available times.', style: TextStyle(color: Colors.grey)),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.t.checkout.selectTimeHint, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.5,
                  ),
                  builder: (context) {
                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Material(
                          color: Theme.of(context).colorScheme.surface,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              const itemHeight = 40.0;
                              const headerHeight = 48.0;
                              const listPadding = 16.0;
                              final modalHeight = constraints.maxHeight - headerHeight - listPadding;
                              final visibleCount = (modalHeight / itemHeight).floor();
                              final selectedIndex = selectedTime == null
                                  ? 0
                                  : response.times.indexOf(selectedTime!);
                              final maxScrollExtent = (response.times.length - visibleCount) * itemHeight;
                              double offset = (selectedIndex - (visibleCount ~/ 2)) * itemHeight;
                              offset = offset.clamp(0, maxScrollExtent > 0 ? maxScrollExtent : 0);
                              offset += headerHeight + listPadding / 2;
                              final scrollController = ScrollController(initialScrollOffset: offset);

                              return SafeArea(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.surface,
                                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                      ),
                                      child: Text(
                                        orderType == OrderType.pickup
                                            ? context.t.checkout.selectPickupTimeTitle
                                            : context.t.checkout.selectDeliveryTimeTitle,
                                        style: Theme.of(context).textTheme.titleMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const Divider(height: 1),
                                    Flexible(
                                      child: ListView.separated(
                                        controller: scrollController,
                                        padding: const EdgeInsets.symmetric(vertical: 8),
                                        itemCount: response.times.length,
                                        separatorBuilder: (_, __) => const Divider(height: 1),
                                        itemBuilder: (context, index) {
                                          final time = response.times[index];
                                          final isSelected = time == selectedTime;
                                          return ListTile(
                                            dense: true,
                                            title: Text(time),
                                            selected: isSelected,
                                            selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
                                            trailing: isSelected
                                                ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                                                : null,
                                            textColor: isSelected
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).colorScheme.onSurface,
                                            onTap: () {
                                              Navigator.pop(context);
                                              onChanged(time);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      color: Theme.of(context).colorScheme.surface,
                                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                                      child: TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text(context.t.checkout.cancelButton, style: TextStyle(color: Colors.red)),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: context.t.checkout.selectTimeHint,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                ),
                child: Text(
                  selectedTime ?? context.t.checkout.selectTimeHint,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}