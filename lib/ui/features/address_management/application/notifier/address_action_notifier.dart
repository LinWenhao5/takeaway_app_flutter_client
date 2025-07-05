import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infrastructure/address_api.dart';
import '../state/address_action_state.dart';
import '../../domain/address_create_request.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

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

class AddressActionNotifier extends StateNotifier<AddressActionState> {
  AddressActionNotifier() : super(AddressActionState());

  Future<void> createAddress(AddressCreateRequest request) async {
    state = state.copyWith(isLoading: true, success: false, error: null, action: AddressActionType.create);
    try {
      await AddressApi.createAddress(request);
      state = state.copyWith(
        isLoading: false,
        success: true,
        error: null,
        action: AddressActionType.create
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: mapAddressErrorToMessage(e.toString()),
        action: AddressActionType.create
      );
    }
  }

  Future<void> updateAddress(int id, AddressCreateRequest request) async {
    state = state.copyWith(isLoading: true, success: false, error: null, action: AddressActionType.update);
    try {
      await AddressApi.updateAddress(id, request);
      state = state.copyWith(
        isLoading: false,
        success: true,
        error: null,
        action: AddressActionType.update
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: mapAddressErrorToMessage(e.toString()),
        action: AddressActionType.update
      );
    }
  }

  Future<void> deleteAddress(int id) async {
    state = state.copyWith(isLoading: true, success: false, error: null, action: AddressActionType.delete);
    try {
      await AddressApi.deleteAddress(id);
      state = state.copyWith(
        isLoading: false,
        success: true,
        error: null,
        action: AddressActionType.delete
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        success: false,
        error: mapAddressErrorToMessage(e.toString()),
        action: AddressActionType.delete
      );
    }
  }

  void reset() {
    state = AddressActionState();
  }
}