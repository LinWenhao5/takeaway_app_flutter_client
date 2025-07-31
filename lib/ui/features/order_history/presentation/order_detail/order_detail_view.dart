import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_status.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_reserve_time_info.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_status_line.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_product_list.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_address_info.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_price_info.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderDetailView extends ConsumerStatefulWidget {
  final int orderId;
  const OrderDetailView({required this.orderId, super.key});

  @override
  ConsumerState<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends ConsumerState<OrderDetailView> {
  Future<void> _refresh() async {
    await ref.read(orderDetailProvider.notifier).fetchOrderDetail(widget.orderId.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(orderDetailProvider.notifier).fetchOrderDetail(widget.orderId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderDetailProvider);

    return RefreshIndicator(
      onRefresh: _refresh,
      child: Builder(
        builder: (context) {
          if (state.isLoading) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Center(
                  child: SpinKitWave(
                    color: Theme.of(context).primaryColor,
                    size: 40.0,
                  ),
                ),
              ],
            );
          }
          if (state.error != null) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Center(
                  child: Text(
                    context.t.errors.genericErrorMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            );
          }
          final order = state.data?.order;
          if (order == null) {
            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                Center(
                  child: Text(
                    context.t.orderHistory.noOrders,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      '${context.t.orderHistory.orderId}${order.id}',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: order.orderType == OrderType.delivery
                            ? Theme.of(context).colorScheme.primary.withAlpha((255 * 0.12).toInt())
                            : Colors.orange.withAlpha((255 * 0.12).toInt()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        order.orderType == OrderType.delivery
                            ? context.t.orderType.delivery
                            : context.t.orderType.pickup,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: order.orderType == OrderType.delivery
                              ? Theme.of(context).colorScheme.primary
                              : Colors.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              OrderStatusLine(status: order.status, orderType: order.orderType),
              const Divider(height: 32, thickness: 1),
              OrderReserveTimeInfo(reserveTime: order.reserveTimeAmsterdam),
              if (order.orderType == OrderType.delivery) ...[
                const Divider(height: 32, thickness: 1),
                OrderAddressInfo(address: order.address),
              ],
              const Divider(height: 32, thickness: 1),
              OrderProductList(products: order.products), 
              const Divider(height: 32),
              OrderPriceInfo(totalPrice: order.totalPrice),
              if (order.status == OrderStatus.unpaid) ...[
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: 跳转支付页面或发起支付
                  },
                  icon: const Icon(Icons.payment),
                  label: Text(context.t.payment.payNow),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}