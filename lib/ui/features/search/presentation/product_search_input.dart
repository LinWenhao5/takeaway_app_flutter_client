import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';

class ProductSearchInput extends ConsumerStatefulWidget {
  const ProductSearchInput({super.key});

  @override
  ConsumerState<ProductSearchInput> createState() => _ProductSearchInputState();
}

class _ProductSearchInputState extends ConsumerState<ProductSearchInput> {
  Timer? _debounce;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchKeywordProvider.notifier).state = value;
    });
  }

  void _clearInput() {
    _controller.clear();
    ref.read(searchKeywordProvider.notifier).state = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: context.t.search.hint,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _clearInput();
                  },
                )
              : null,
        ),
        onChanged: (value) {
          setState(() {});
          _onChanged(value);
        }
      ),
    );
  }
}