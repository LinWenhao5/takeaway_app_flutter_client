// Provider for search keyword
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/infrastructure/product_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/domain/product.dart';

final searchKeywordProvider = StateProvider<String>((ref) => '');

final productSearchProvider = FutureProvider<List<Product>>((ref) {
  final keyword = ref.watch(searchKeywordProvider);
  if (keyword.isEmpty) return Future.value([]);
  return ProductApi.searchProducts(keyword);
});

final isSearchActiveProvider = StateProvider<bool>((ref) => false);