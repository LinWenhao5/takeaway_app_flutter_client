import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? media;
  const ProductImage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    if (media != null && media!.isNotEmpty) {
      return Image.network(
        media!,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.image_not_supported);
        },
      );
    } else {
      return const Icon(Icons.image_not_supported, size: 45);
    }
  }
}