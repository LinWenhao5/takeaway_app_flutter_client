import 'package:flutter/material.dart';

class OrderProductList extends StatelessWidget {
  final List products;
  const OrderProductList({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.fastfood, size: 20, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text('Products', style: theme.textTheme.titleSmall),
          ],
        ),
        const SizedBox(height: 8),
        ...products.map((product) => Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    product.name,
                    style: theme.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'x${product.pivot?['quantity'] ?? 0}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha((255 * 0.7).toInt()),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '€${product.price}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Divider(height: 16),
          ],
        )),
      ],
    );
  }
}