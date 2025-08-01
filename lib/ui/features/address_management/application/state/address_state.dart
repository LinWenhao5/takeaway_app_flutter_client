import 'package:takeaway_app_flutter_client/ui/features/address_management/domain/address.dart';

class AddressState {
  final bool isLoading;
  final List<Address> addresses;
  final String? error;

  AddressState({this.isLoading = false, this.addresses = const [], this.error});

  static const _unset = Object();

  AddressState copyWith({
    bool? isLoading,
    Object? addresses = _unset,
    Object? error = _unset,
  }) {
    return AddressState(
      isLoading: isLoading ?? this.isLoading,
      addresses:
          addresses == _unset ? this.addresses : addresses as List<Address>,
      error: error == _unset ? this.error : error as String?,
    );
  }
}
