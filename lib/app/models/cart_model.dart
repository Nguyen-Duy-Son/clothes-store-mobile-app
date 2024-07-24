import 'package:clothes_store_mobile_app/app/models/product_card.dart';

class Cart {
  final String userId;
  final List<ProductCart>? listProducts;

  Cart({
    required this.userId,
    required this.listProducts,
  });
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      userId: json['userId'] as String,
      listProducts: json['listProducts'] != null
          ? (json['listProducts'] as List).map((i) => ProductCart.fromJson(i)).toList()
          : null,
    );
  }
}
