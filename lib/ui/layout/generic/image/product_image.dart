import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final List media;
  const ProductImage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    if (media.isNotEmpty) {
      return Image.network(
        media.first.path,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.image_not_supported);
        },
      );
    } else {
      return const Icon(Icons.image_not_supported);
    }
  }
}