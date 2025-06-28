import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/presentation/cart_view.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.cart.checkout_basket),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: CartView(),
      ),
    );
  }
}