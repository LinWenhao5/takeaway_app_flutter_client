import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/theme/theme.dart';
import 'package:takeaway_app_flutter_client/ui/layout/pages/main/presentation/main_scaffold.dart';


class TakeawayApp extends ConsumerWidget {
  const TakeawayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme, 
      home: const MainScaffold(),
    );
  }
}