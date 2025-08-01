import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/orders_page.dart';

class OrderHistoryResponse {
  final bool success;
  final OrdersPage orders;

  OrderHistoryResponse({required this.success, required this.orders});

  factory OrderHistoryResponse.fromJson(Map<String, dynamic> json) {
    return OrderHistoryResponse(
      success: json['success'] ?? false,
      orders: OrdersPage.fromJson(json['orders']),
    );
  }
}
