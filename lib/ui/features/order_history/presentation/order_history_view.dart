import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_card.dart';

class OrderHistoryView extends ConsumerWidget {
  const OrderHistoryView({super.key});

  List<Order> todayOrders(List<Order> orders) {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return orders.where((o) {
      final orderDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(o.createdAt));
      return orderDate == today;
    }).toList();
  }

  List<Order> pastOrders(List<Order> orders) {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return orders.where((o) {
      final orderDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(o.createdAt));
      return orderDate != today;
    }).toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderHistoryProvider);
    final notifier = ref.read(orderHistoryProvider.notifier);
    final scrollController = ScrollController();

    if (state.data == null && !state.isLoading && state.error == null) {
      Future.microtask(() => notifier.fetchOrderHistory(refresh: true));
    }

    if (state.isLoading && (state.data == null || state.data!.orders.data.isEmpty)) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text(context.t.errors.genericErrorMessage));
    }
    if (state.data == null || state.data!.orders.data.isEmpty) {
      return Center(child: Text(context.t.orderHistory.noOrders));
    }

    final orders = state.data!.orders.data;
    final hasMore = state.data!.orders.nextPageUrl != null;

    final today = todayOrders(orders);
    final past = pastOrders(orders);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (hasMore &&
            scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 100 &&
            !state.isLoading) {
          notifier.fetchOrderHistory();
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async {
          await notifier.fetchOrderHistory(refresh: true);
        },
        child: Scrollbar(
          controller: scrollController,
          thumbVisibility: true,
          child: Container(
            color: Theme.of(context).colorScheme.surface,
            child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.only(bottom: 32),
              children: [
                if (today.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                            child: Text(
                              context.t.orderHistory.today,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...today.map((order) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: OrderCard(order: order),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
                if (past.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.center,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                            child: Text(
                              context.t.orderHistory.past,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ...past.map((order) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: OrderCard(order: order),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
                if (hasMore)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const CircularProgressIndicator(strokeWidth: 2),
                        const SizedBox(height: 8),
                        Text(
                          context.t.orderHistory.loadingMore,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}