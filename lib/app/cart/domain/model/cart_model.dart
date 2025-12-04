class CartProduct {
  final int productId;
  final int quantity;

  CartProduct({
    required this.productId,
    required this.quantity,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) {
    return CartProduct(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }
}

class CartModel{
  final int id;
  final int userId;
  final List<CartProduct> products;

  const CartModel({
    required this.id,
    required this.userId,
    required this.products,
  });

factory CartModel.fromJson(Map<String, dynamic> json) {
return CartModel(
id: json['id'] ?? 0,
  userId: json['userId'] ?? 0,
  products: (json['products'] as List)
 . map((e) => CartProduct.fromJson(e))
 .toList(),
);
}
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'products': products.map((e) => e.toJson()).toList(),
    };
  }}
