import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';

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
    final dates = List.generate(5, (i) => DateTime.now().add(Duration(days: i)));

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Consumer(
              builder: (context, ref, _) {
                final selectedDate = ref.watch(selectedDateProvider);
                final availableTimesAsync = ref.watch(availableTimesProvider);
                final orderType = ref.watch(selectedOrderTypeProvider);

                final String headerText = orderType == OrderType.delivery
                    ? context.t.checkout.selectDeliveryTimeTitle
                    : context.t.checkout.selectPickupTimeTitle;

                return Material(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          headerText,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const Divider(height: 1),
                      Expanded(
                        child: Row(
                          children: [
                            // 左侧日期栏
                            Container(
                              width: 130,
                              color: Theme.of(context).colorScheme.surface,
                              child: ListView.builder(
                                itemCount: dates.length,
                                itemBuilder: (context, index) {
                                  final date = dates[index];
                                  final isSelected = date.day == selectedDate.day &&
                                      date.month == selectedDate.month &&
                                      date.year == selectedDate.year;

                                  return ListTile(
                                    tileColor: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : Colors.transparent,
                                    shape: isSelected
                                        ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                                        : null,
                                    title: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          index == 0
                                              ? context.t.common.today
                                              : context.t.common.weekdays[date.weekday - 1],
                                          textAlign: TextAlign.center,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).textTheme.bodyMedium?.color,
                                          ),
                                        ),
                                        Text(
                                          "${date.day} ${context.t.common.months[date.month - 1]}",
                                          textAlign: TextAlign.center,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).textTheme.bodyMedium?.color,
                                          ),
                                        ),
                                      ],
                                    ),
                                    selected: isSelected,
                                    onTap: () {
                                      ref.read(selectedDateProvider.notifier).state = date;
                                    },
                                  );
                                },
                              ),
                            ),
                            // 垂直分割线
                            const VerticalDivider(width: 1, thickness: 1),
                            // 右侧时间列表
                            Expanded(
                              child: availableTimesAsync.when(
                                loading: () => Center(
                                  child: SpinKitFadingGrid(
                                    color: Theme.of(context).primaryColor,
                                    size: 32
                                  ),
                                ),
                                error: (err, _) => Center(child: Text(context.t.errors.genericErrorMessage)),
                                data: (response) {
                                  if (response.times.isEmpty) {
                                    return Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.info_outline, size: 40, color: Theme.of(context).colorScheme.onSurface),
                                            const SizedBox(height: 16),
                                            Text(
                                              context.t.checkout.closedMessage,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Theme.of(context).colorScheme.onSurface,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  return ListView.separated(
                                    itemCount: response.times.length,
                                    separatorBuilder: (_, __) => const Divider(height: 1),
                                    itemBuilder: (context, index) {
                                      final time = response.times[index];
                                      final fullTime = DateTimeUtil.formatFullDateTime(selectedDate, time);
                                      final isSelected = fullTime == selectedTime;
                                      return ListTile(
                                        title: Text(
                                          time,
                                          style: TextStyle(
                                            color: isSelected
                                                ? Theme.of(context).colorScheme.primary
                                                : Theme.of(context).textTheme.bodyMedium?.color,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                          ),
                                        ),
                                        trailing: isSelected
                                            ? Icon(Icons.check_circle, color: Theme.of(context).colorScheme.secondary)
                                            : null,
                                        selected: isSelected,
                                        shape: isSelected
                                            ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                                            : null,
                                        onTap: () {
                                          Navigator.pop(context);
                                          onChanged(fullTime);
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
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