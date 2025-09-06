
import 'package:takeaway_app_flutter_client/api/api_client.dart';

import '../domain/delivery_setting.dart';

class DeliveryApi {
  static Future<DeliverySetting> fetchDeliverySetting() async {
    final data = await ApiClient.get('/delivery/settings');
    return DeliverySetting.fromJson(data);
  }
}