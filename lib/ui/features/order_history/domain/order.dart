import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/address_snapshot.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product.dart';

class Order {
  final int id;
  final String status;
  final String totalPrice;
  final String createdAt;
  final AddressSnapshot address;
  final List<Product> products;

  Order({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.address,
    required this.products,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      status: json['status'],
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      address: AddressSnapshot.fromJson(json['address_snapshot']),
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}