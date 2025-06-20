import 'package:takeaway_app_flutter_client/api/share/model_cart/get_cart_response.dart';

class FetchCartState {
  final bool isLoading;
  final GetCartResponse? getCartResponse;
  final String? errorMessage;

  FetchCartState({
    required this.isLoading,
    this.getCartResponse,
    this.errorMessage,
  });

  factory FetchCartState.initial() {
    return FetchCartState(
      isLoading: false,
      getCartResponse: null,
      errorMessage: null,
    );
  }

  FetchCartState copyWith({
    bool? isLoading,
    GetCartResponse? getCartResponse,
    String? errorMessage,
  }) {
    return FetchCartState(
      isLoading: isLoading ?? this.isLoading,
      getCartResponse: getCartResponse ?? this.getCartResponse,
      errorMessage: errorMessage,
    );
  }
}