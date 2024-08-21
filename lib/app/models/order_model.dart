import 'package:clothes_store_mobile_app/app/cubits/track_order/track_order_state.dart';
import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
import 'package:clothes_store_mobile_app/app/models/product_model.dart';
import 'package:clothes_store_mobile_app/app/models/track_order_model.dart';

import 'leave_review_model.dart';

class Order{
  final String id;
  final String userId;
  final List<TrackOrder> productsActive;
  final List<LeaveReview> productsCompleted;
  final List<ProductCart> productsCanceled;
  Order({
    required this.userId,
    required this.id,
    required this.productsActive,
    required this.productsCanceled,
    required this.productsCompleted,
  });
  factory Order.fromJson(Map<String, dynamic> json){
    return Order(
      userId: json['userId'],
      id: json['id'],
      productsActive: (json['productsActive'] as List).map((e) => TrackOrder.fromJson(e)).toList(),
      productsCanceled: (json['productsCanceled'] as List).map((e) => ProductCart.fromJson(e)).toList(),
      productsCompleted: (json['productsCompleted'] as List).map((e) => LeaveReview.fromJson(e)).toList(),
    );
  }
}