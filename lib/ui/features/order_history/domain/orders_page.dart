import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';

class OrdersPage {
  final int currentPage;
  final List<Order> data;
  final int lastPage;
  final int perPage;
  final int total;
  final String? nextPageUrl;

  OrdersPage({
    required this.currentPage,
    required this.data,
    required this.lastPage,
    required this.perPage,
    required this.total,
    this.nextPageUrl,
  });

  factory OrdersPage.fromJson(Map<String, dynamic> json) {
    return OrdersPage(
      currentPage: json['current_page'],
      data: (json['data'] as List).map((e) => Order.fromJson(e)).toList(),
      lastPage: json['last_page'],
      perPage: json['per_page'],
      total: json['total'],
      nextPageUrl: json['next_page_url'],
    );
  }
}
