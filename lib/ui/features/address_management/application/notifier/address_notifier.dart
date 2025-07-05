import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/address_state.dart';
import '../../infrastructure/address_api.dart';
import '../../domain/address.dart';

class AddressNotifier extends StateNotifier<AddressState> {
  AddressNotifier() : super(AddressState(isLoading: true)) {
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await AddressApi.getAddresses();
      final List<Address> addresses = response.addresses;
      state = state.copyWith(isLoading: false, addresses: addresses, error: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}