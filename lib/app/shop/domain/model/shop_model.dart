class ShopModel{
  final int id;
  final String name;
  final String description;
  final double rating;
  final String image;

  const ShopModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.image,

});
  factory ShopModel.fromJson(Map<String, dynamic> json) {
    return ShopModel(
        id: json['id']?? 0,
        name: json['name']?? '',
        description: json['description']?? '',
        rating: (json['rating'] as num?)?.toDouble()?? 0.0,
        image: json['image']?? '',
    );
  }

  Map<String, dynamic> toJson() {
return {
  'id': id,
  'name': name,
  'description': description,
  'rating': rating,
  'image': image,
};
}
}