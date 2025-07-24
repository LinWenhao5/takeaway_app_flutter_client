import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/order_history/presentation/order_list/order_history_view.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/order/presentation/order_page.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/settings/presentaion/settings_page.dart';

class PageConfig {
  final Widget page;
  final String Function(BuildContext) titleBuilder;

  const PageConfig({required this.page, required this.titleBuilder});
}

final pagesConfigList = [
  PageConfig(
    page: const OrderPage(),
    titleBuilder: (context) => context.t.navbar.order,
  ),
  PageConfig(
    page: const OrderHistoryView(),
    titleBuilder: (context) => context.t.navbar.orderHistory,
  ),
  PageConfig(
    page: const SettingsPage(),
    titleBuilder: (context) => context.t.navbar.profile,
  ),
];