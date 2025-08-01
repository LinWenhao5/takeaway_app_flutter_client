import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'dart:async';
import 'package:takeaway_app_flutter_client/main_app.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class TakeawayAppWrapper extends StatefulWidget {
  const TakeawayAppWrapper({super.key});

  @override
  State<TakeawayAppWrapper> createState() => _TakeawayAppWrapperState();
}

class _TakeawayAppWrapperState extends State<TakeawayAppWrapper> {
  StreamSubscription? _sub;
  late final AppLinks _appLinks;

  @override
  void initState() {
    super.initState();

    if (kIsWeb) {
      final uri = Uri.base;
      if (uri.path == '/payment-callback' &&
          uri.queryParameters['order_id'] != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigatorKey.currentState?.pushNamedAndRemoveUntil(
            '/payment-result',
            ModalRoute.withName('/'),
            arguments: int.tryParse(uri.queryParameters['order_id'] ?? '') ?? 0,
          );
        });
      }
    }

    _appLinks = AppLinks();
    _sub = _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null && uri.host == 'payment-callback') {
        navigatorKey.currentState?.pushNamedAndRemoveUntil(
          '/payment-result',
          ModalRoute.withName('/'),
          arguments: int.tryParse(uri.queryParameters['order_id'] ?? '') ?? 0,
        );
      }
    });
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const TakeawayApp();
  }
}
