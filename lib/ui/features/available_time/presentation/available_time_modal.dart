import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/available_time/application/provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

final _localSelectedDateProvider = StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

class AvailableTimeModal extends ConsumerWidget {
  final String? selectedTime;
  final ValueChanged<String?> onChanged;
  final OrderType orderType;

  const AvailableTimeModal({
    super.key,
    required this.selectedTime,
    required this.onChanged,
    required this.orderType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dates = List.generate(5, (i) => DateTime.now().add(Duration(days: i)));
    final selectedDate = ref.watch(_localSelectedDateProvider);

    final availableTimesAsync = ref.watch(
      availableTimesProvider(
        AvailableTimesParams(orderType: orderType, selectedDate: selectedDate),
      ),
    );

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
                // 日期栏
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
                            ? RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )
                            : null,
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              index == 0
                                  ? context.t.common.today
                                  : context.t.common.weekdays[date.weekday - 1],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                              ),
                            ),
                            Text(
                              "${date.day} ${context.t.common.months[date.month - 1]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                              ),
                            ),
                          ],
                        ),
                        selected: isSelected,
                        onTap: () {
                          ref.read(_localSelectedDateProvider.notifier).state = date;
                        },
                      );
                    },
                  ),
                ),
                const VerticalDivider(width: 1, thickness: 1),
                // 时间列表
                Expanded(
                  child: availableTimesAsync.when(
                    loading: () => Center(
                      child: SpinKitFadingGrid(
                        color: Theme.of(context).primaryColor,
                        size: 32,
                      ),
                    ),
                    error: (err, _) => Center(
                      child: Text(context.t.errors.genericErrorMessage),
                    ),
                    data: (response) {
                      if (response.times.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
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
                          final fullTime = DateTimeUtil.formatFullDateTime(
                            selectedDate,
                            time,
                          );
                          final isSelected = fullTime == selectedTime;
                          return ListTile(
                            title: Text(
                              time,
                              style: TextStyle(
                                color: isSelected
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.color,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                            trailing: isSelected
                                ? Icon(
                                    Icons.check_circle,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                  )
                                : null,
                            selected: isSelected,
                            shape: isSelected
                                ? RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )
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
  }
}