// import 'package:clothes_store_mobile_app/app/models/track_order_model.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../models/product_cart.dart';
//
// class TrackOrderState extends Equatable {
//   final List<TrackOrder> trackOrders;
//   final TrackOrder trackOrderSelected;
//
//   const TrackOrderState(this.trackOrders, this.trackOrderSelected);
//
//   @override
//   List<Object> get props => [trackOrders, trackOrderSelected];
// }
//
// class TrackOrderInital extends TrackOrderState {
//   TrackOrderInital()
//       : super(
//             [],
//             TrackOrder(
//                 id: "",
//                 productDart: ProductCart(
//                     productId: "",
//                     count: 0,
//                     name: '',
//                     price: 0,
//                     image: '',
//                     size: ''),
//                 expectedDeliveryDate: DateTime.now(),
//                 trackingId: "",
//                 orderPlaced:
//                     OrderPlaced(orderPlacedDate: DateTime.now(), status: true),
//                 inProgress:
//                     InProgress(inProgressDate: DateTime.now(), status: true),
//                 shipped: Shipped(shippedDate: DateTime.now(), status: true),
//                 delivered:
//                     Delivered(deliveredDate: DateTime.now(), status: true)));
// }
//
// class TrackOrderLoading extends TrackOrderState {
//   const TrackOrderLoading(super.trackOrders, super.trackOrderSelected);
// }
//
// class TrackOrderError extends TrackOrderState {
//   final String message;
//
//   const TrackOrderError(
//       super.trackOrders, this.message, super.trackOrderSelected);
// }
//
// class TrackOrderLoaded extends TrackOrderState {
//   const TrackOrderLoaded(super.trackOrders, super.trackOrderSelected);
// }
