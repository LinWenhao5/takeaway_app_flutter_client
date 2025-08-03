import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/domain/store_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/store/infrastructure/store_api.dart';

final storeProvider = FutureProvider<StoreResponse>((ref) async {
  return await StoreApi.fetchStore();
});