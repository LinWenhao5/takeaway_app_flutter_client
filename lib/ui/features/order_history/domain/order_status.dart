enum OrderStatus {
  unpaid,
  paid,
  delivering,
  completed,
}

extension OrderStatusExtension on OrderStatus {
  String get value {
    switch (this) {
      case OrderStatus.unpaid:
        return 'unpaid';
      case OrderStatus.paid:
        return 'paid';
      case OrderStatus.delivering:
        return 'delivering';
      case OrderStatus.completed:
        return 'completed';
    }
  }

  static OrderStatus fromString(String status) {
    switch (status) {
      case 'unpaid':
        return OrderStatus.unpaid;
      case 'paid':
        return OrderStatus.paid;
      case 'delivering':
        return OrderStatus.delivering;
      case 'completed':
        return OrderStatus.completed;
      default:
        return OrderStatus.unpaid;
    }
  }
}