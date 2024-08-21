import 'package:clothes_store_mobile_app/app/models/product_cart.dart';

class TrackOrder {
  final String id;
  final ProductCart productCart;
  final DateTime expectedDeliveryDate;
  final String trackingId;
  final OrderPlaced orderPlaced;
  final InProgress inProgress;
  final Shipped shipped;
  final Delivered delivered;
  TrackOrder({
    required this.id,
    required this.productCart,
    required this.expectedDeliveryDate,
    required this.trackingId,
    required this.orderPlaced,
    required this.inProgress,
    required this.shipped,
    required this.delivered,
  });
  factory TrackOrder.fromJson(Map<String, dynamic> json) {
    return TrackOrder(
      id: json['id'] as String,
      productCart:  ProductCart.fromJson(json['productCart']),
      expectedDeliveryDate: DateTime.parse(json['expectedDeliveryDate']),
      trackingId: json['trackingId'],
      orderPlaced: OrderPlaced.fromJson(json['orderPlaced']),
      inProgress: InProgress.fromJson(json['inProgress']),
      shipped: Shipped.fromJson(json['shipped']),
      delivered: Delivered.fromJson(json['delivered']),
    );
  }
}

class OrderPlaced {
  final DateTime orderPlacedDate;
  final bool status;

  OrderPlaced({required this.orderPlacedDate, required this.status});

  factory OrderPlaced.fromJson(Map<String, dynamic> json) {
    return OrderPlaced(
      orderPlacedDate: DateTime.parse(json['orderPlacedDate']),
      status: json['status'],
    );
  }
}

class InProgress {
  final DateTime inProgressDate;
  final bool status;

  InProgress({required this.inProgressDate, required this.status});

  factory InProgress.fromJson(Map<String, dynamic> json) {
    return InProgress(
      inProgressDate: DateTime.parse(json['inProgressDate']),
      status: json['status'],
    );
  }
}

class Shipped {
  final DateTime shippedDate;
  final bool status;

  Shipped({required this.shippedDate, required this.status});

  factory Shipped.fromJson(Map<String, dynamic> json) {
    return Shipped(
      shippedDate: DateTime.parse(json['shippedDate']),
      status: json['status'],
    );
  }
}
class Delivered {
  final DateTime deliveredDate;
  final bool status;

  Delivered({required this.deliveredDate, required this.status});

  factory Delivered.fromJson(Map<String, dynamic> json) {
    return Delivered(
      deliveredDate: DateTime.parse(json['deliveredDate']),
      status: json['status'],
    );
  }
}
