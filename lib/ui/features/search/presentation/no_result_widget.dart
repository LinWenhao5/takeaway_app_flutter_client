import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/colors.dart';
import 'package:takeaway_app_flutter_client/theme/preset/base/text_theme.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';

class NoResultWidget extends StatelessWidget {
  const NoResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_dissatisfied,
            color: kPrimaryColor,
            size: 64,
          ),
          const SizedBox(height: 16),
          Text(
            t.search.noResult,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            t.search.tryAnotherKeyword,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}