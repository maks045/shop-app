import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';
import 'package:shop_app/app/shop/presentation/screen/product_card.dart';
import 'package:shop_app/app/shop/presentation/screen/product_card3.dart';

class SearchResultsList extends StatelessWidget {
  final List<ProductModel> products;

  const SearchResultsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Text('No products found'),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(product: product);
      },
    );
  }
}
