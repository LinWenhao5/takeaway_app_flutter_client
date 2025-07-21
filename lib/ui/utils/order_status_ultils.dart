import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class OrderStatusUtils {
  static Color getStatusColor(String status) {
    switch (status) {
      case 'paid':
        return Colors.green;
      case 'unpaid':
        return Colors.orange;
      case 'delivering':
        return Colors.blue;
      case 'completed':
        return Colors.grey;
      default:
        return Colors.black54;
    }
  }

  static IconData getStatusIcon(String status) {
    switch (status) {
      case 'paid':
        return Icons.check_circle;
      case 'unpaid':
        return Icons.hourglass_top;
      case 'delivering':
        return Icons.local_shipping;
      case 'completed':
        return Icons.done_all;
      default:
        return Icons.help_outline;
    }
  }

  static String getStatusText(BuildContext context, String status) {
    switch (status) {
      case 'paid':
        return context.t.orderStatus.paid;
      case 'unpaid':
        return context.t.orderStatus.unpaid;
      case 'delivering':
        return context.t.orderStatus.delivering;
      case 'completed':
        return context.t.orderStatus.completed;
      default:
        return context.t.orderStatus.unknown;
    }
  }
}