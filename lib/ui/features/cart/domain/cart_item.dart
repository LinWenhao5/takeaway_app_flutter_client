class CartItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String? image;
  final String quantity;
  final String subtotal;

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.quantity,
    required this.subtotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      subtotal: json['subtotal'],
    );
  }

  CartItem copyWith({
    int? id,
    String? name,
    String? description,
    String? price,
    String? image,
    String? quantity,
    String? subtotal,
  }) {
    return CartItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }
}