import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/application/order_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

final selectedAddressIdProvider = StateProvider<int?>((ref) => null);

final orderNotifierProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(ref),
);

final selectedOrderTypeProvider = StateProvider<OrderType>(
  (ref) => OrderType.delivery,
);

final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());

final selectedReserveTimeProvider = StateProvider<String?>((ref) => null);

final checkoutNoteProvider = StateProvider<String>((ref) => '');
