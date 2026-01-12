import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shop/domain/model/product_model.dart';
import '../domain/model/cart_item.dart';

final cartProvider =
StateNotifierProvider<CartNotifier, Map<int, CartItem>>(
      (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<Map<int, CartItem>> {
  CartNotifier() : super({});

  void add(ProductModel product) {
    final item = state[product.id];

    if (item != null) {
      if (item.quantity < product.stock) {
        state = {
          ...state,
          product.id:
          item.copyWith(quantity: item.quantity + 1),
        };
      }
    } else {
      state = {
        ...state,
        product.id: CartItem(product: product, quantity: 1),
      };
    }
  }
  // void add1(ProductModel product){
  //   final item= state[product.id];
  //   if(item!=null) {
  //     if (item.quantity < product.stock)
  //       state = {
  //         ...state,
  //         product.id: item.copyWith(quantity: item.quantity + 1),
  //
  //   })
  // }

  void remove(ProductModel product) {
    final item = state[product.id];
    if (item == null) return;

    if (item.quantity > 1) {
      state = {
        ...state,
        product.id:
        item.copyWith(quantity: item.quantity - 1),
      };
    } else {
      final newState = {...state};
      newState.remove(product.id);
      state = newState;
    }
  }
}