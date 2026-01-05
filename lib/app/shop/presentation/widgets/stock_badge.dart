import 'package:flutter/material.dart';
import 'package:shop_app/app/shop/domain/model/product_model.dart';

class StockBadge extends StatelessWidget {
  final ProductModel product;
  const StockBadge({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: product.stock == 0 ? Colors.red[100] : Colors.orange[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        product.stock == 0 ? "Out of Stock" : "Only ${product.stock} left",
        style: TextStyle(
          fontSize: 10,
          color: product.stock == 0 ? Colors.red[800] : Colors.orange[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
