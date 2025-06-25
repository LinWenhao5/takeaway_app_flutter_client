import 'package:takeaway_app_flutter_client/ui/features/search/domain/product_media.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<ProductMedia> media;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.media,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: (json['price'] is String)
            ? double.parse(json['price'])
            : (json['price'] as num).toDouble(),
        media: (json['media'] as List<dynamic>?)
                ?.map((e) => ProductMedia.fromJson(e))
                .toList() ??
            [],
      );
}