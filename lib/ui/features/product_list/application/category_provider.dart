import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_product/product_category_api.dart';
import 'package:takeaway_app_flutter_client/api/share/model_product/product_category.dart';

final categoryWithProductsProvider = FutureProvider<List<ProductCategory>>((ref) async {
  return await ProductCategoryApi.fetchCategoriesWithProducts();
});