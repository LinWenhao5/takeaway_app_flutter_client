import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_search_input.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_search_result.dart';


class ProductSearch extends StatelessWidget {
  
 const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const ProductSearchInput(),
          const ProductSearchResult(),
        ],
      ),
    );
  }
}