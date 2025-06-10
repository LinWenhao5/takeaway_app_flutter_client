import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';

class SearchErrorWidget extends StatelessWidget {

  const SearchErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off, color: kErrorColor, size: 48),
            const SizedBox(height: 16),
            Text(
              context.t.search.loadFailed,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}