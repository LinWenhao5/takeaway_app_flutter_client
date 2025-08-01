import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/infrastructure/product_category_api.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product_category.dart';

final categoryWithProductsProvider = FutureProvider<List<ProductCategory>>((
  ref,
) async {
  return await ProductCategoryApi.fetchCategoriesWithProducts();
});
