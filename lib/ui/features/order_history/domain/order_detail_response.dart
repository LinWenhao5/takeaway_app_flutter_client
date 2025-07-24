import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';

class OrderDetailResponse {

  final bool success;
  final Order order;

  OrderDetailResponse({required this.success, required this.order});

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailResponse(
      success: json['success'],
      order: Order.fromJson(json['order']),
    );
  }
}