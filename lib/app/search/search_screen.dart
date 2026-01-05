import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/app/search/widget/category_card.dart';
import 'package:shop_app/app/search/widget/discount_header.dart';
import 'package:shop_app/app/search/widget/featured_product_section.dart';
import 'package:shop_app/app/search/widget/recommended_product_section.dart';
import 'package:shop_app/app/search/widget/search_field.dart';
import 'package:shop_app/app/search/widget/search_results_list.dart';
import 'package:shop_app/app/shop/app/product_provider.dart';
import 'package:shop_app/app/shop/app/product_search_provider.dart';
import 'package:shop_app/core/theme/app_theme.dart';
import 'package:shop_app/core/utils/app_loading_page.dart';
import 'package:shop_app/core/utils/divider.dart';

// class SearchScreen extends ConsumerStatefulWidget {
//   const SearchScreen({super.key});

//   @override
//   ConsumerState<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends ConsumerState<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   void _onSearch() {
//     ref
//         .read(productSearchProvider.notifier)
//         .search(_searchController.text.trim());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final products = ref.watch(productProvider);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppTheme.surfaceVariant,
//         title: SearchField(controller: _searchController),
//         actions: [
//           IconButton(icon: const Icon(Icons.search), onPressed: _onSearch),
//         ],
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const SizedBox(height: 16),
//               const CategoryListScreen(),
//               const SizedBox(height: 16),
//               const AppDivider(),
//               const SizedBox(height: 8),
//               DiscountHeader(),
//               const SizedBox(height: 12),
//               products.when(
//                 loading: () => const Center(child: AppLoadingPage()),
//                 error: (err, stack) => Center(child: Text('Error:$err')),
//                 data: (_) {
//   final products = searchState.filteredProducts;
//   final isSearching = searchState.query.isNotEmpty;

//   return SingleChildScrollView(
//     child: Column(
//       children: [
//         const SizedBox(height: 16),
//         const CategoryListScreen(),
//         const SizedBox(height: 16),
//         const AppDivider(),
//         const SizedBox(height: 8),

//         if (!isSearching) ...[
//           const DiscountHeader(),
//           const SizedBox(height: 12),
//           FeaturedProductSection(products: products),
//           const SizedBox(height: 24),
//           RecommendedProductSection(products: products),
//         ],

//         if (isSearching) ...[
//           const SizedBox(height: 12),
//           SearchResultsList(products: products),
//         ],
//       ],
//     ),
//   );
// },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearch() {
    ref
        .read(productSearchProvider.notifier)
        .search(_searchController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(productProvider);
    final searchState = ref.watch(productSearchProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.surfaceVariant,
        title: SearchField(controller: _searchController),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: _onSearch),
        ],
      ),
      body: productAsync.when(
        loading: () => const Center(child: AppLoadingPage()),
        error: (err, _) => Center(child: Text('Error: $err')),
        data: (allProducts) {
          final isSearching = searchState.query.isNotEmpty;
          final products = isSearching
              ? searchState.filteredProducts
              : allProducts;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 16),
                const CategoryListScreen(),
                const SizedBox(height: 16),
                const AppDivider(),
                const SizedBox(height: 8),

                if (!isSearching) ...[
                  const DiscountHeader(),
                  const SizedBox(height: 12),
                  FeaturedProductSection(products: products),
                  const SizedBox(height: 24),
                  RecommendedProductSection(products: products),
                ],

                if (isSearching) ...[
                  const SizedBox(height: 12),
                  SearchResultsList(products: products), // ✅ grid works
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
