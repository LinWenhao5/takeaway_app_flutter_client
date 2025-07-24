import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/providers.dart';
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
    final theme = Theme.of(context);
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
                    color: theme.colorScheme.primary,
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
                    style: theme.textTheme.titleMedium,
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
                    style: theme.textTheme.titleMedium,
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
                child: Text(
                  '${context.t.orderHistory.orderId}${order.id}',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              OrderStatusLine(status: order.status),
              const SizedBox(height: 20),
              OrderAddressInfo(address: order.address),
              const Divider(height: 32, thickness: 1),
              OrderPriceInfo(totalPrice: order.totalPrice),
              const Divider(height: 32, thickness: 1),
              OrderProductList(products: order.products),
              if (order.status == 'unpaid') ...[
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: 跳转支付页面或发起支付
                  },
                  icon: const Icon(Icons.payment),
                  label: Text(context.t.payment.payNow),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
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