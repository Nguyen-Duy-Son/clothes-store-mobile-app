// import 'package:clothes_store_mobile_app/app/cubits/track_order/track_order_state.dart';
// import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../models/track_order_model.dart';
//
// class TrackOrderCubit extends Cubit<TrackOrderState> {
//   TrackOrderCubit() : super(TrackOrderInital());
//
//   void getTrackOrder() {
//     emit(TrackOrderLoading(state.trackOrders,state.trackOrderSelected));
//     try {
//       emit(TrackOrderLoaded(trackOrders,state.trackOrderSelected));
//     } catch (e) {
//       emit(TrackOrderError(state.trackOrders, e.toString(),state.trackOrderSelected));
//     }
//   }
//   void getTrackOrderByProductCartId(String productCartId) {
//     try {
//       final trackOrder = trackOrders.firstWhere((element) => element.productDart.productId == productCartId);
//       emit(TrackOrderLoaded(state.trackOrders, trackOrder));
//     } catch (e) {
//       emit(TrackOrderError(state.trackOrders, e.toString(),state.trackOrderSelected));
//     }
//   }
// }
//
// final List<Map<String, dynamic>> jsonTrackOrder = [
//   {
//     "id": "1",
//     "productId": "1",
//     "expectedDeliveryDate": "2022-12-12",
//     "trackingId": "123456",
//     "orderPlaced": {
//       "orderPlacedDate": "2022-12-12",
//       "status": true
//     },
//     "inProgress": {
//       "inProgressDate": "2022-12-12",
//       "status": true
//     },
//     "shipped": {
//       "shippedDate": "2022-12-12",
//       "status": true
//     },
//     "delivered": {
//       "deliveredDate": "2022-12-12",
//       "status": true
//     },
//   },
//   {
//     "id": "2",
//     "productId": "2",
//     "expectedDeliveryDate": "2022-12-12",
//     "trackingId": "123456",
//     "orderPlaced": {
//       "orderPlacedDate": "2022-12-12",
//       "status": true
//     },
//     "inProgress": {
//       "inProgressDate": "2022-12-12",
//       "status": true
//     },
//     "shipped": {
//       "shippedDate": "2022-12-12",
//       "status": true
//     },
//   },
//   {
//     "id": "3",
//     "productId": "3",
//     "expectedDeliveryDate": "2022-12-12",
//     "trackingId": "123456",
//     "orderPlaced": {
//       "orderPlacedDate": "2022-12-12",
//       "status": true
//     },
//     "inProgress": {
//       "inProgressDate": "2022-12-12",
//       "status": true
//     },
//     "shipped": {
//       "shippedDate": "2022-12-12",
//       "status": true
//     },
//   }
// ];
// final List<TrackOrder> trackOrders = jsonTrackOrder.map((e) => TrackOrder.fromJson(e)).toList();