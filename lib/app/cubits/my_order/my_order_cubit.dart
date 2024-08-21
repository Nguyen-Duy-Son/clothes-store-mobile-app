import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/order_model.dart';
import '../../models/track_order_model.dart';
import 'my_order_state.dart';

class MyOrderCubit extends Cubit<MyOrderState> {
  late TrackOrder trackOrder;
  MyOrderCubit() : super(MyOrderInitial());

  Future<void> getMyOrder() async {
    emit(MyOrderLoading());
    try {
      final order = Order.fromJson(jsonOrder);
      emit(MyOrderLoaded(order));
    } catch (e) {
      emit(MyOrderError(e.toString()));
    }
  }
  Future<void> getTrackOrderByProductCartId(String productCartId) async {
    emit(MyOrderLoading());
    try {
      int index = state.order.productsActive.indexWhere((element) => element.productCart.productId == productCartId);
      if(index != -1){
        trackOrder = state.order.productsActive[index];
      } else {
        emit(MyOrderError("Track Order not found"));
      }
    } catch (e) {
      emit(MyOrderError(e.toString()));
    }
  }
}

final Map<String, dynamic> jsonOrder = {
  "userId": "user123",
  "id":"1",
  "productsActive": [
    {
      "productCart":{
        "productId": "1",
        "count": 2,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 17.0,
        "size": "M"
      },
      "id":"1",
      "expectedDeliveryDate": "2022-12-12",
      "trackingId": "123456",
      "orderPlaced": {
          "orderPlacedDate": "2022-12-12",
          "status": true
        },
      "inProgress": {
          "inProgressDate": "2022-12-12",
          "status": true
        },
      "shipped": {
          "shippedDate": "2022-12-12",
          "status": true
        },
      "delivered": {
        "deliveredDate": "2022-12-12",
        "status": false
      },
      },
    {
      "productCart":{
        "productId": "2",
        "count": 2,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 17.0,
        "size": "M"
      },
      "id":"2",
      "expectedDeliveryDate": "2022-12-12",
      "trackingId": "123456",
      "orderPlaced": {
        "orderPlacedDate": "2022-12-12",
        "status": true
      },
      "inProgress": {
        "inProgressDate": "2022-12-12",
        "status": true
      },
      "shipped": {
        "shippedDate": "2022-12-12",
        "status": true
      },
      "delivered": {
        "deliveredDate": "2022-12-12",
        "status": true
      },
    },
    {
      "productCart":{
        "productId": "3",
        "count": 2,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 17.0,
        "size": "M"
      },
      "id":"3",
      "expectedDeliveryDate": "2022-12-12",
      "trackingId": "123456",
      "orderPlaced": {
        "orderPlacedDate": "2022-12-12",
        "status": true
      },
      "inProgress": {
        "inProgressDate": "2022-12-12",
        "status": true
      },
      "shipped": {
        "shippedDate": "2022-12-12",
        "status": true
      },
      "delivered": {
        "deliveredDate": "2022-12-12",
        "status": true
      },
    },
  ],
  "productsCompleted": [
    {
      "productCart": {
        "productId": "1",
        "count": 2,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 17.0,
        "size": "M"
      },
      "id":"1",
      "rating": 4,
      "review": "",
    },
    {
      "productCart": {
        "productId": "2",
        "count": 5,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 100.0,
        "size": "XL"
      },
      "id":"2",
      "rating": 1,
      "review": "",
    },
    {
      "productCart": {
        "productId": "5",
        "count": 50,
        "name": "Product 1",
        "image": "https://loremflickr.com/640/480/fashion",
        "price": 124.0,
        "size": "XLL"
      },
      "id":"3",
      "rating": 3,
      "review": "",
    },
  ],
  "productsCanceled":[
    {
      "productId": "4",
      "name": "Product 4",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17.0,
      "size": "M",
      "count": 3,
    },
    {
      "productId": "5",
      "name": "Product 5",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17.0,
      "size": "L",
      "count": 3,
    },
    {
      "productId": "6",
      "name": "Product 6",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17.0,
      "size": "XXL",
      "count": 3,
    },
  ],
};
