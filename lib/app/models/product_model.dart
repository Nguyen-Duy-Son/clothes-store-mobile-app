class Product{
  final String name;
  final String image;
  final String id;
  final int price;
  final int categoryId;
  final String rating;
  Product({required this.name, required this.image, required this.id, required this.price, required this.categoryId, required this.rating});

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
        name: json['name'],
        image: json['image'],
        id: json['id'] as String,
        price: json['price'] as int,
        categoryId: json['categoryId'] as int,
        rating: json['rating'] as String
    );
  }
}