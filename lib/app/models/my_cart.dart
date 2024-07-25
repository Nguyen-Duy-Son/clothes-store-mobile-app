import 'package:clothes_store_mobile_app/app/models/product_cart.dart';

class MyCart {
  final String userId;
  final List<ProductCart>? listProducts;

  MyCart({
    required this.userId,
    required this.listProducts,
  });
  factory MyCart.fromJson(Map<String, dynamic> json) {
    return MyCart(
      userId: json['userId'] as String,
      listProducts: json['listProducts'] != null
          ? (json['listProducts'] as List).map((i) => ProductCart.fromJson(i)).toList()
          : null,
    );
  }
}