class AddressSnapshot {
  final String city;
  final String name;
  final String phone;
  final String street;
  final String country;
  final String postcode;
  final String houseNumber;

  AddressSnapshot({
    required this.city,
    required this.name,
    required this.phone,
    required this.street,
    required this.country,
    required this.postcode,
    required this.houseNumber,
  });

  factory AddressSnapshot.fromJson(Map<String, dynamic> json) {
    return AddressSnapshot(
      city: json['city'],
      name: json['name'],
      phone: json['phone'],
      street: json['street'],
      country: json['country'],
      postcode: json['postcode'],
      houseNumber: json['house_number'],
    );
  }
}
