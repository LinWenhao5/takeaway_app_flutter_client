import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product.dart';

class ProductDetailsSection extends StatelessWidget {
  final Product product;
  const ProductDetailsSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 4),
        Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 8),
        Text(
          '€${product.price}',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}