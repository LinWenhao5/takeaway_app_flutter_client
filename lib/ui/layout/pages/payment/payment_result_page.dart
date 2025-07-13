import 'package:flutter/material.dart';

class PaymentResultPage extends StatelessWidget {
  final String? orderId;
  const PaymentResultPage({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Result')),
      body: Center(
        child: Text(
          orderId != null
              ? 'Order ID: $orderId\nPlease fetch and display the order result here.'
              : 'No order ID found.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}