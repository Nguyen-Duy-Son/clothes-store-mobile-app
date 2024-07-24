class ProductCart{
  final String productId;
  final String name;
  final String image;
  final int price;
  final String size;

  int count;

  ProductCart({
    required this.productId,
    required this.count,
    required this.name,
    required this.image,
    required this.price,
    required this.size,
  });
  factory ProductCart.fromJson(Map<String, dynamic> json) {
    return ProductCart(
      productId: json['productId'],
      count: json['count'] as int,
      name: json['name'],
      image: json['image'],
      price: json['price'] as int,
      size: json['size'],
    );
  }
}