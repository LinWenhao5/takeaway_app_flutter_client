import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_card.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';

class OrderHistoryView extends ConsumerStatefulWidget {
  const OrderHistoryView({super.key});

  @override
  ConsumerState<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends ConsumerState<OrderHistoryView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        final notifier = ref.read(orderHistoryProvider.notifier);
        notifier.fetchOrderHistory();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Order> todayOrders(List<Order> orders) {
    final today = DateTimeUtil.todayInAmsterdam();
    return orders.where((o) {
      final orderDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(o.createdAtAmsterdam));
      return orderDate == today;
    }).toList();
  }

  List<Order> pastOrders(List<Order> orders) {
    final today = DateTimeUtil.todayInAmsterdam();
    return orders.where((o) {
      final orderDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(o.createdAtAmsterdam));
      return orderDate != today;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderHistoryProvider);
    final notifier = ref.read(orderHistoryProvider.notifier);

    if (state.isLoading && (state.data == null || state.data!.orders.data.isEmpty)) {
      return Center(child: SpinKitWave(
        color: Theme.of(context).colorScheme.primary,
        size: 32,
      ));
    }
    if (state.error != null) {
      return Center(child: Text(context.t.errors.genericErrorMessage));
    }

    if (state.data == null && !state.isLoading && state.error == null) {
      Future.microtask(() => notifier.fetchOrderHistory());
    }

    return RefreshIndicator(
      onRefresh: () async {
        await notifier.fetchOrderHistory(refresh: true);
      },
      child: (state.data == null || state.data!.orders.data.isEmpty)
          ? ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Center(child: Text(context.t.orderHistory.noOrders)),
              ],
            )
          : ListView(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 32),
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 500,
                  ),
                  child: Column(
                    children: [
                      if (todayOrders(state.data!.orders.data).isNotEmpty) ...[
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
                                ...todayOrders(state.data!.orders.data).map((order) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: OrderCard(order: order),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (pastOrders(state.data!.orders.data).isNotEmpty) ...[
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
                                ...pastOrders(state.data!.orders.data).map((order) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: OrderCard(order: order),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                      if (state.data!.orders.nextPageUrl != null)
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
              ],
            ),
    );
  }
}