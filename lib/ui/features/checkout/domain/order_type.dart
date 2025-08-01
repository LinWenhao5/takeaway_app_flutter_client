enum OrderType { delivery, pickup }

extension OrderTypeExtension on OrderType {
  String get value {
    switch (this) {
      case OrderType.delivery:
        return 'delivery';
      case OrderType.pickup:
        return 'pickup';
    }
  }
}
