class AddressCreateRequest {
  final String name;
  final String phone;
  final String street;
  final String houseNumber;
  final String postcode;
  final String city;
  final String country;

  AddressCreateRequest({
    required this.name,
    required this.phone,
    required this.street,
    required this.houseNumber,
    required this.postcode,
    required this.city,
    required this.country,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'street': street,
        'house_number': houseNumber,
        'postcode': postcode,
        'city': city,
        'country': country,
      };
}