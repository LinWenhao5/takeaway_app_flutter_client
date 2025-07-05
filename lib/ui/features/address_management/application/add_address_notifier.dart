import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'add_address_state.dart';
import '../infrastructure/address_api.dart';
import '../domain/address_create_request.dart';

String mapAddressErrorToMessage(String error) {
  final lower = error.toLowerCase();
  if (lower.contains('postcode')) {
    return t.errors.unsupportedPostcode;
  }
  if (lower.contains('phone')) {
    return t.errors.invalidPhone;
  }
  if (lower.contains('street')) {
    return t.errors.invalidStreet;
  }
  return t.errors.genericErrorMessage;
}

class AddAddressNotifier extends StateNotifier<AddAddressState> {
  AddAddressNotifier() : super(AddAddressState());

  Future<void> createAddress(AddressCreateRequest request) async {
    state = state.copyWith(isLoading: true, error: null, success: false);
    try {
      await AddressApi.createAddress(request);
      state = state.copyWith(isLoading: false, success: true, error: null);
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: mapAddressErrorToMessage(e.toString()),
        success: false,
      );
    }
  }
}