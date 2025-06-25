import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/domain/product.dart';

class ProductApi {
  static Future<List<Product>> searchProducts(String keyword) async {
    final data = await ApiClient.get('/products/search', params: {'keyword': keyword});
    final List products = data['products'];
    return products.map((e) => Product.fromJson(e)).toList();
  }
}