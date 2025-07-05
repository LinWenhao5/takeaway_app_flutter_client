import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/add_address_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/add_address_state.dart';
import 'address_notifier.dart';
import 'address_state.dart';

final addressNotifierProvider =
    StateNotifierProvider<AddressNotifier, AddressState>(
  (ref) => AddressNotifier(),
);

final addAddressNotifierProvider =
    StateNotifierProvider<AddAddressNotifier, AddAddressState>(
  (ref) => AddAddressNotifier(),
);