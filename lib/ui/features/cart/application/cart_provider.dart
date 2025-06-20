import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/api/api_cart/cart_api.dart';
import 'package:takeaway_app_flutter_client/api/share/model_cart/add_to_cart_response.dart';
import 'package:takeaway_app_flutter_client/api/share/model_cart/get_cart_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/error_mapper.dart';
import 'package:takeaway_app_flutter_client/ui/utils/error_handler.dart';

final fetchCartProvider = FutureProvider<GetCartResponse>((ref) async {
  return await CartApi.getCart();
});

final addProductToCartProvider = FutureProvider.family<AddToCartResponse, Map<String, dynamic>>((ref, params) async {
  final productId = params['productId'] as int;
  final quantity = params['quantity'] as int;
  final context = params['context'] as BuildContext;

  try {
    return await CartApi.addToCart(productId, quantity);
  } catch (e) {
    throw handleError(context, e, mapAddToCartErrorToLocalizedMessage);
  }
});