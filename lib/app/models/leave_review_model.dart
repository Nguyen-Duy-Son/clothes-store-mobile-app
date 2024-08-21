import 'package:clothes_store_mobile_app/app/models/product_cart.dart';

class LeaveReview{
  final ProductCart productCart;
  final String review;
  final int rating;
  final String id;
  LeaveReview({
    required this.productCart,
    required this.review,
    required this.rating,
    required this.id,
  });
  factory LeaveReview.fromJson(Map<String, dynamic> json) {
    return LeaveReview(
      productCart: ProductCart.fromJson(json['productCart']),
      review: json['review'] as String,
      rating: json['rating'] as int,
      id: json['id'] as String,
    );
  }
}