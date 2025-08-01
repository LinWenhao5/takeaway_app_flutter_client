import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/payment/domain/order_status_response.dart';

class PaymentApi {
  static Future<OrderStatusResponse> getOrderStatus(int orderId) async {
    final response = await ApiClient.get('/orders/$orderId/status');
    return OrderStatusResponse.fromJson(response);
  }
}
