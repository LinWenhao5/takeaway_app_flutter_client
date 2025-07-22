import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product.dart';


class ProductCategory {
  final int id;
  final int? mediaId;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<Product> products;

  ProductCategory({
    required this.id,
    required this.mediaId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
        id: json['id'],
        mediaId: json['media_id'] == null ? null : int.tryParse(json['media_id'].toString()),
        name: json['name'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        products: (json['products'] as List<dynamic>)
            .map((e) => Product.fromJson(e))
            .toList(),
      );
}