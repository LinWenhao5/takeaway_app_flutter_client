import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/config/app_config.dart';

class ProductImage extends StatelessWidget {
  final List media;
  const ProductImage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    if (media.isNotEmpty) {
      final imageBaseUrl = AppConfig.imageBaseUrl;
      return Image.network(
        '$imageBaseUrl${media.first.path}',
        width: 48,
        height: 48,
        fit: BoxFit.cover,
      );
    } else {
      return const Icon(Icons.image_not_supported);
    }
  }
}