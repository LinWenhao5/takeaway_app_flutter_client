import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_history_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_detail_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_repay_response.dart';

class OrderHistoryApi {
  static Future<OrderHistoryResponse> getOrderHistory({int page = 1}) async {
    final response = await ApiClient.get('/orders?page=$page');
    return OrderHistoryResponse.fromJson(response);
  }

  static Future<OrderDetailResponse> getOrderDetail(String orderId) async {
    final response = await ApiClient.get('/orders/$orderId');
    return OrderDetailResponse.fromJson(response);
  }

  static Future<OrderRepayResponse> repayOrder(String orderId) async {
    final response = await ApiClient.post('/orders/$orderId/repay');
    return OrderRepayResponse.fromJson(response);
  }

  static Future<void> updateReserveTime(String orderId, String reserveTime) async {
    await ApiClient.put(
      '/orders/$orderId/reserve-time',
      body: {'reserve_time': reserveTime},
    );
  }
}
