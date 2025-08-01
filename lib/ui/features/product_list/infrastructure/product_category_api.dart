import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product_category.dart';

class ProductCategoryApi {
  static Future<List<ProductCategory>> fetchCategoriesWithProducts() async {
    final response = await ApiClient.get('/product-categories/full');
    final List data = response['categories'];
    return data.map((e) => ProductCategory.fromJson(e)).toList();
  }
}
