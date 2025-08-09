import 'package:takeaway_app_flutter_client/ui/features/checkout/domain/order_type.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/address_snapshot.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/domain/order_status.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product.dart';
import 'package:takeaway_app_flutter_client/ui/utils/datetime_util.dart';

class Order {
  final int id;
  final OrderStatus status;
  final String totalPrice;
  final String createdAt;
  final String reserveTime;
  final AddressSnapshot? address;
  final List<Product> products;
  final OrderType orderType;
  final String note;

  Order({
    required this.id,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.reserveTime,
    required this.address,
    required this.products,
    required this.orderType,
    required this.note,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      status: OrderStatusExtension.fromString(json['status']),
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      reserveTime: json['reserve_time'] ?? '',
      address:
          json['address_snapshot'] != null
              ? AddressSnapshot.fromJson(json['address_snapshot'])
              : null,
      products:
          (json['products'] as List<dynamic>? ?? [])
              .map((e) => Product.fromJson(e as Map<String, dynamic>))
              .toList(),
      orderType:
          json['order_type'] == 'pickup'
              ? OrderType.pickup
              : OrderType.delivery,
      note: json['note'] ?? '',
    );
  }

  String get createdAtAmsterdam => DateTimeUtil.formatToAmsterdam(createdAt);

  String get reserveTimeAmsterdam =>
      DateTimeUtil.formatToAmsterdam(reserveTime);

  String get reserveTimeAmsterdamHuman =>
      DateTimeUtil.formatReserveTimeHuman(reserveTime);
}
