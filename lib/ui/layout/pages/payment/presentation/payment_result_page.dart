import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/utils/order_status_ultils.dart';
import '../application/provider.dart';

class PaymentResultPage extends ConsumerStatefulWidget {
  final int? orderId;
  const PaymentResultPage({super.key, this.orderId});

  @override
  ConsumerState<PaymentResultPage> createState() => _PaymentResultPageState();
}

class _PaymentResultPageState extends ConsumerState<PaymentResultPage> {
  Timer? _timer;
  int pollCount = 0;
  static const maxPoll = 15;

  @override
  void initState() {
    super.initState();
    if (widget.orderId != null) {
      _startPolling();
    }
  }

  void _startPolling() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      pollCount++;
      ref.read(paymentNotifierProvider.notifier).fetchOrderStatus(widget.orderId!);
      final state = ref.read(paymentNotifierProvider);
      if (state.data != null && state.data!.status != 'unpaid') {
        timer.cancel();
      }
      if (pollCount >= maxPoll) {
        timer.cancel();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.t.orderResult.timeout)),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(paymentNotifierProvider);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(context.t.orderResult.title)),
      body: Center(
        child: widget.orderId == null
            ? Text(
                context.t.orderResult.noOrderId,
                style: textTheme.bodyLarge?.copyWith(fontSize: 18),
              )
            : state.isLoading
                ? SpinKitWave(
                    color: Theme.of(context).primaryColor,
                    size: 40.0,
                  )
                : state.error != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: Colors.red, size: 48),
                          const SizedBox(height: 16),
                          Text(
                            '${context.t.errors.genericErrorMessage}: ${state.error ?? ''}',
                            style: textTheme.bodyLarge?.copyWith(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      )
                    : state.data != null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                OrderStatusUtils.getStatusIcon(state.data!.status),
                                color: OrderStatusUtils.getStatusColor(state.data!.status),
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '${context.t.orderResult.orderId}: ${state.data!.orderId}',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${context.t.orderResult.status}: ${OrderStatusUtils.getStatusText(context, state.data!.status)}',
                                style: textTheme.bodyLarge?.copyWith(
                                  color: OrderStatusUtils.getStatusColor(state.data!.status),
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to order details page
                                },
                                child: Text(
                                  context.t.orderResult.goToOrderPage,
                                  style: textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text(
                            context.t.orderResult.noOrderInfo,
                            style: textTheme.bodyLarge?.copyWith(fontSize: 18),
                          ),
      ),
    );
  }
}