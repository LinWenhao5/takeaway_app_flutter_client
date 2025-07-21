import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/application/payment_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/application/payment_state.dart';

final paymentNotifierProvider = StateNotifierProvider<PaymentNotifier, OrderStatusState>(
  (ref) => PaymentNotifier(),
);