import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/login_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/auth/presentation/register_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/cart/cart_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/checkout/checkout_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/settings/presentation/account/account_settings_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/address_management_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/add_address_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/presentation/edit_address_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/order_history/order_detail_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/order_history/order_histroy_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/presentation/payment_result_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/presentation/manual_payment_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => const LoginPage(),
  '/register': (context) => const RegisterPage(),
  '/cart': (context) => const CartPage(),
  '/checkout': (context) => const CheckoutPage(),
  '/account-settings': (context) => const AccountSettingsPage(),
  '/address-management': (context) => const AddressManagementPage(),
  '/add-address': (context) => const AddAddressPage(),
  '/edit-address': (context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    return EditAddressPage(address: args as Address);
  },
  '/payment-result': (context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as int?;
    return PaymentResultPage(orderId: orderId);
  },
  '/manual-payment': (context) {
    final url = ModalRoute.of(context)!.settings.arguments as String?;
    return ManualPaymentPage(paymentUrl: url);
  },
  '/order-history': (context) => const OrderHistoryPage(),
  '/order-detail': (context) {
    final orderId = ModalRoute.of(context)!.settings.arguments as int?;
    return OrderDetailPage(orderId: orderId);
  },
};