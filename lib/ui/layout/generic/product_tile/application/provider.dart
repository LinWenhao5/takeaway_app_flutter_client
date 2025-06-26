import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/application/quantity_notifier.dart';

final quantityProvider = StateNotifierProvider.family<QuantityNotifier, int, int>((ref, productId) {
  return QuantityNotifier();
});