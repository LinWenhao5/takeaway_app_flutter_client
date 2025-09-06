import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../infrastructure/delivery_api.dart';
import 'delivery_setting_state.dart';

class DeliverySettingNotifier extends StateNotifier<DeliverySettingState> {
  DeliverySettingNotifier() : super(DeliverySettingState());

  Future<void> fetch() async {
    state = state.copyWith(loading: true, error: null);
    try {
      final setting = await DeliveryApi.fetchDeliverySetting();
      state = state.copyWith(setting: setting, loading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), loading: false);
    }
  }
}