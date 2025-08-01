import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:takeaway_app_flutter_client/ui/features/cart/application/cart_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/application/category_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/presentation/basket_bar.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/presentation/product_tab_view.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/application/search_provider.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_search_input.dart';
import 'package:takeaway_app_flutter_client/ui/features/search/presentation/product_search_result.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/error/error_display_widget.dart';

class OrderPage extends ConsumerStatefulWidget {
  const OrderPage({super.key});

  @override
  ConsumerState<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends ConsumerState<OrderPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(isSearchActiveProvider.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryAsync = ref.watch(categoryWithProductsProvider);
    final isSearchActive = ref.watch(isSearchActiveProvider);
    final cartSummary = ref.watch(cartSummaryProvider);

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: ProductSearchInput(),
            ),
            if (isSearchActive)
              Expanded(
                child: SingleChildScrollView(
                  child: const ProductSearchResult(),
                ),
              ),
            if (!isSearchActive)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return ref.refresh(categoryWithProductsProvider.future);
                  },
                  child: categoryAsync.when(
                    data:
                        (categories) => CategoryTabView(categories: categories),
                    loading:
                        () => Center(
                          child: SpinKitWave(
                            color: Theme.of(context).primaryColor,
                            size: 40.0,
                          ),
                        ),
                    error:
                        (e, stack) => ErrorDisplayWidget(
                          errorMessage: context.t.errors.connectionError,
                          onRetry: () async {
                            return ref.refresh(
                              categoryWithProductsProvider.future,
                            );
                          },
                        ),
                  ),
                ),
              ),
          ],
        ),
        // Basket Bar
        if (cartSummary.totalQuantity != "0")
          BasketBar(cartSummary: cartSummary),
      ],
    );
  }
}
