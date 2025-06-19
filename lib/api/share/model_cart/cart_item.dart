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
}