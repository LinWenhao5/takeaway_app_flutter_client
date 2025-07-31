import 'package:flutter/foundation.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart' show ApiClient;
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_create_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/available_times_response.dart';
import 'package:takeaway_app_flutter_client/ui/utils/get_platform.dart';

class OrderApi {
  static Future<OrderCreateResponse> createOrder({
    required OrderType orderType,
    int? addressId,
    required String reserveTime,
  }) async {
    final platform = getPlatform();
    final host = kIsWeb ? Uri.base.origin : null;
    final body = <String, dynamic>{
      'order_type': orderType.value,
      'reserve_time': reserveTime,
      'platform': platform,
      if (host != null) 'host': host,
      if (orderType == OrderType.delivery && addressId != null) 'address_id': addressId,
    };

    final response = await ApiClient.post(
      '/orders',
      body: body,
    );
    return OrderCreateResponse.fromJson(response);
  }

  static Future<AvailableTimesResponse> fetchAvailableTimes({
    required OrderType orderType,
    String? date,
  }) async {
    final query = [
      'order_type=${orderType.value}',
      if (date != null) 'date=$date',
    ].join('&');

    final response = await ApiClient.get(
      '/business-hours/available-times?$query',
    );
    return AvailableTimesResponse.fromJson(response);
  }
}