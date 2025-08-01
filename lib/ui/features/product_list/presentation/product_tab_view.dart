import 'package:flutter/material.dart';
import 'package:takeaway_app_flutter_client/ui/features/product_list/domain/product_category.dart';
import 'package:takeaway_app_flutter_client/ui/layout/generic/product_tile/presentation/product_tile.dart';

class CategoryTabView extends StatefulWidget {
  final List<ProductCategory> categories;
  const CategoryTabView({super.key, required this.categories});

  @override
  State<CategoryTabView> createState() => _CategoryTabViewState();
}

class _CategoryTabViewState extends State<CategoryTabView>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _categoryKeys = [];
  bool _isTabTapped = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.categories.length,
      vsync: this,
    );
    _categoryKeys.addAll(
      List.generate(widget.categories.length, (_) => GlobalKey()),
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabTap(int index) {
    setState(() {
      _isTabTapped = true;
    });

    final keyContext = _categoryKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      ).then((_) {
        setState(() {
          _isTabTapped = false;
        });
      });
    }
  }

  void _onScroll() {
    if (_isTabTapped) return;

    for (int i = 0; i < _categoryKeys.length; i++) {
      final keyContext = _categoryKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero, ancestor: null).dy;
        if (offset > 0 && offset < 200) {
          if (_tabController.index != i) {
            _tabController.animateTo(i);
          }
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: widget.categories.map((c) => Tab(text: c.name)).toList(),
          onTap: _onTabTap,
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              final category = widget.categories[index];
              return Container(
                key: _categoryKeys[index],
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Divider(thickness: 1),
                    const SizedBox(height: 8),
                    ...category.products.map((p) => ProductTile(product: p)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
