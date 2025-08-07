import 'package:takeaway_app_flutter_client/ui/features/available_time/domain/available_times_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/api/api_client.dart';

class AvailableTimeApi {
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