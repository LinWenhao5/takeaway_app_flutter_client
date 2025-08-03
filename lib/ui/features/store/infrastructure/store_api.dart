import 'package:takeaway_app_flutter_client/api/api_client.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/domain/store_response.dart';

class StoreApi {
  static Future<StoreResponse> fetchStore() async {
    final data = await ApiClient.get('/store');
    return StoreResponse.fromJson(data);
  }
}