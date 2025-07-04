import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../address_management/application/address_notifier.dart';
import '../../address_management/application/address_state.dart';

final addressNotifierProvider =
    StateNotifierProvider<AddressNotifier, AddressState>(
  (ref) => AddressNotifier(),
);