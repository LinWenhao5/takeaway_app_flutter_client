import '../domain/delivery_setting.dart';

class DeliverySettingState {
  final DeliverySetting? setting;
  final bool loading;
  final String? error;

  DeliverySettingState({
    this.setting,
    this.loading = false,
    this.error,
  });

  DeliverySettingState copyWith({
    DeliverySetting? setting,
    bool? loading,
    String? error,
  }) {
    return DeliverySettingState(
      setting: setting ?? this.setting,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}