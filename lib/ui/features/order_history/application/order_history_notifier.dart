import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/application/order_history_state.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_history_response.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/orders_page.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/infrastructure/order_history_api.dart';

class OrderHistoryNotifier extends StateNotifier<OrderHistoryState> {
  OrderHistoryNotifier() : super(OrderHistoryState());

  int _page = 1;
  bool _hasMore = true;
  List<Order> _orders = [];

  Future<void> fetchOrderHistory({bool refresh = false}) async {
    if (refresh) {
      _page = 1;
      _orders = [];
      _hasMore = true;
    }
    if (!_hasMore) return;

    state = state.copyWith(isLoading: true, error: null);
    try {
      final response = await OrderHistoryApi.getOrderHistory(page: _page);
      final pageData = response.orders;
      if (refresh) {
        _orders = pageData.data;
      } else {
        _orders.addAll(pageData.data);
      }
      _hasMore = pageData.nextPageUrl != null;
      _page++;
      state = state.copyWith(
        isLoading: false,
        data: OrderHistoryResponse(success: true, orders: OrdersPage(
          currentPage: pageData.currentPage,
          data: _orders,
          lastPage: pageData.lastPage,
          perPage: pageData.perPage,
          total: pageData.total,
          nextPageUrl: pageData.nextPageUrl,
        )),
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void reset() {
    _page = 1;
    _hasMore = true;
    _orders = [];
    state = OrderHistoryState();
  }
}
