import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_cart/cart_api.dart';
import 'package:takeaway_app_flutter_client/api/share/model_cart/get_cart_response.dart';

final cartProvider = FutureProvider<GetCartResponse>((ref) async {
  return await CartApi.getCart();
});