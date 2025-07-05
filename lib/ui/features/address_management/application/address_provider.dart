import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/notifier/address_action_notifier.dart';
import 'package:takeaway_app_flutter_client/ui/features/address_management/application/state/address_action_state.dart';
import 'notifier/address_notifier.dart';
import 'state/address_state.dart';

final addressNotifierProvider =
    StateNotifierProvider<AddressNotifier, AddressState>(
  (ref) => AddressNotifier(),
);

final addressActionNotifierProvider =
    StateNotifierProvider<AddressActionNotifier, AddressActionState>(
  (ref) => AddressActionNotifier(),
);