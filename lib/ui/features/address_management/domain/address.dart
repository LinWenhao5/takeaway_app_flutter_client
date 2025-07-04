class Address {
  final int id;
  final int customerId;
  final String name;
  final String phone;
  final String street;
  final String houseNumber;
  final String postcode;
  final String city;
  final String country;
  final DateTime createdAt;
  final DateTime updatedAt;

  Address({
    required this.id,
    required this.customerId,
    required this.name,
    required this.phone,
    required this.street,
    required this.houseNumber,
    required this.postcode,
    required this.city,
    required this.country,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'] as int,
      customerId: json['customer_id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      street: json['street'] as String,
      houseNumber: json['house_number'] as String,
      postcode: json['postcode'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}