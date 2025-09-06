class DeliverySetting {
  final double minimumAmount;
  final double fee;

  DeliverySetting({
    required this.minimumAmount,
    required this.fee,
  });

  factory DeliverySetting.fromJson(Map<String, dynamic> json) {
    return DeliverySetting(
      minimumAmount: (json['minimum_amount'] as num).toDouble(),
      fee: (json['fee'] as num).toDouble(),
    );
  }
}