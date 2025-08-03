class StoreResponse {
  final int id;
  final String name;
  final String phone;
  final String street;
  final String houseNumber;
  final String postcode;
  final String city;
  final String country;
  final DateTime createdAt;
  final DateTime updatedAt;

  StoreResponse({
    required this.id,
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

  factory StoreResponse.fromJson(Map<String, dynamic> json) {
    return StoreResponse(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      street: json['street'],
      houseNumber: json['house_number'],
      postcode: json['postcode'],
      city: json['city'],
      country: json['country'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}