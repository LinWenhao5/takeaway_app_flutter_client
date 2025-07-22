import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_history_response.dart';

class OrderHistoryApi {
  static Future<OrderHistoryResponse> getOrderHistory({int page = 1}) async {
    final response = await ApiClient.get('/orders?page=$page');
    return OrderHistoryResponse.fromJson(response);
  }
}