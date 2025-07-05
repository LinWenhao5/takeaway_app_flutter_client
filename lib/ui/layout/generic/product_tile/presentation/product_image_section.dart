import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/domain/product.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/image/product_image.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/radius.dart';

class ProductImageSection extends StatelessWidget {
  final Product product;
  const ProductImageSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kListTileRadius),
      child: product.media.isNotEmpty
          ? ProductImage(media: product.media.first.path)
          : const Icon(Icons.image_not_supported, size: 45),
    );
  }
}
