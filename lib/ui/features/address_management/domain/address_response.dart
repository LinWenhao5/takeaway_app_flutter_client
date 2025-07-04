import 'address.dart';

class AddressResponse {
  final bool success;
  final List<Address> addresses;

  AddressResponse({
    required this.success,
    required this.addresses,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      success: json['success'] as bool,
      addresses: (json['addresses'] as List)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}