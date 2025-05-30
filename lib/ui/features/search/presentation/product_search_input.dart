import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';

class ProductSearchInput extends ConsumerWidget {
  const ProductSearchInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: context.t.search.hint,
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: (value) => ref.read(searchKeywordProvider.notifier).state = value,
      ),
    );
  }
}