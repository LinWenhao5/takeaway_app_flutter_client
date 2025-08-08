import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_detail/order_detail_view.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderDetailPage extends StatelessWidget {
  final int? orderId;
  const OrderDetailPage({required this.orderId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.orderDetails.orderDetails)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
            orderId == null
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.error_outline, size: 40),
                        const SizedBox(height: 12),
                        Text(context.t.errors.missingOrderParam, textAlign: TextAlign.center),
                      ],
                    ),
                )
                : OrderDetailView(orderId: orderId!),
      ),
    );
  }
}

