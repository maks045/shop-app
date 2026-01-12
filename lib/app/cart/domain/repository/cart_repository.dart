import '../model/cart_model.dart';
import '../model/cart_item.dart';

CartModel toApiCart({
  required int cartId,
  required int userId,
  required Map<int, CartItem> cartItems,
}) {
  return CartModel(
    id: cartId,
    userId: userId,
    products: cartItems.values
        .map(
          (item) => CartProduct(
        productId: item.product.id,
        quantity: item.quantity,
      ),
    )
        .toList(),
  );
}

