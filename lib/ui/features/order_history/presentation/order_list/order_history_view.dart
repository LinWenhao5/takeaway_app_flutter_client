import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_list/order_section.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_list/loading_more_indicator.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';

class OrderHistoryView extends ConsumerStatefulWidget {
  const OrderHistoryView({super.key});

  @override
  ConsumerState<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends ConsumerState<OrderHistoryView> {
  final ScrollController _scrollController = ScrollController();
  bool _isPagingLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderHistoryProvider.notifier).fetchOrderHistory();
    });

    _scrollController.addListener(() async {
      final state = ref.read(orderHistoryProvider);
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 50) {
        if (!_isPagingLoading &&
            !state.isLoading &&
            state.data!.orders.nextPageUrl != null) {
          _isPagingLoading = true;
          await ref.read(orderHistoryProvider.notifier).fetchOrderHistory();
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _isPagingLoading = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Order> reservedOrders(List<Order> orders) {
    final today = DateTimeUtil.todayInAmsterdam();
    final todayDate = DateTime.parse(today);
    return orders.where((o) {
      try {
        if (o.reserveTime.isEmpty) return false;
        final orderDate = DateTime.parse(o.reserveTime);
        return orderDate.isAtSameMomentAs(todayDate) ||
            orderDate.isAfter(todayDate);
      } catch (_) {
        return false;
      }
    }).toList();
  }

  List<Order> pastOrders(List<Order> orders) {
    final today = DateTimeUtil.todayInAmsterdam();
    final todayDate = DateTime.parse(today);
    return orders.where((o) {
      try {
        if (o.reserveTime.isEmpty) return true;
        final orderDate = DateTime.parse(o.reserveTime);
        return orderDate.isBefore(todayDate);
      } catch (_) {
        return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderHistoryProvider);
    final notifier = ref.read(orderHistoryProvider.notifier);

    if (state.isLoading &&
        (state.data == null || state.data!.orders.data.isEmpty)) {
      return Center(
        child: SpinKitWave(color: Theme.of(context).primaryColor, size: 32),
      );
    }
    if (state.error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 40),
            const SizedBox(height: 12),
            Text(state.error!, textAlign: TextAlign.center),
          ],
        ),
      );
    }
    if (state.data == null) {
      return SizedBox.shrink();
    }

    final reservedOrdersList = reservedOrders(state.data!.orders.data);
    final pastOrdersList = pastOrders(state.data!.orders.data);

    return RefreshIndicator(
      onRefresh: () async {
        await notifier.fetchOrderHistory(refresh: true);
      },
      child:
          (state.data!.orders.data.isEmpty)
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
                  OrderSection(
                    title: context.t.orderHistory.reserved,
                    orders: reservedOrdersList,
                  ),
                  OrderSection(
                    title: context.t.orderHistory.past,
                    orders: pastOrdersList,
                  ),
                  if (state.data!.orders.nextPageUrl != null)
                    const LoadingMoreIndicator(),
                ],
              ),
    );
  }
}
