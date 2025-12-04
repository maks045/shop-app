class ProductModel{
  final int id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String brand;
  final List<String> images;
  final int stock;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.brand,
    required this.images,
    required this.stock,
});

  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] ?? '',
      brand: json['brand'] ?? '',
      images: (json['images'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      stock: json['stock'] ?? 0,
    );
  }}