import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_status.dart';
import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';

class OrderStatusUtils {
  static List<OrderStatus> getSteps(OrderType orderType) {
    if (orderType == OrderType.pickup) {
      return [
        OrderStatus.unpaid,
        OrderStatus.paid,
        OrderStatus.completed,
      ];
    } else {
      // delivery
      return [
        OrderStatus.unpaid,
        OrderStatus.paid,
        OrderStatus.delivering,
        OrderStatus.completed,
      ];
    }
  }

  static Color getStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.paid:
        return Colors.green;
      case OrderStatus.unpaid:
        return Colors.grey;
      case OrderStatus.delivering:
        return Colors.lightBlueAccent;
      case OrderStatus.completed:
        return Colors.blue;
    }
  }

  static String getStatusText(BuildContext context, OrderStatus status) {
    switch (status) {
      case OrderStatus.paid:
        return context.t.orderStatus.paid;
      case OrderStatus.unpaid:
        return context.t.orderStatus.unpaid;
      case OrderStatus.delivering:
        return context.t.orderStatus.delivering;
      case OrderStatus.completed:
        return context.t.orderStatus.completed;
    }
  }

  static IconData getPaymentStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.paid:
        return Icons.check_circle;
      case OrderStatus.unpaid:
        return Icons.hourglass_top;
      case OrderStatus.delivering:
        return Icons.local_shipping;
      case OrderStatus.completed:
        return Icons.done_all;
    }
  }

  static IconData getOrderStatusIcon(OrderStatus status) {
    switch (status) {
      case OrderStatus.paid:
        return Icons.receipt_long;
      case OrderStatus.unpaid:
        return Icons.receipt;
      case OrderStatus.delivering:
        return Icons.local_shipping;
      case OrderStatus.completed:
        return Icons.check_circle_outline;
    }
  }
}