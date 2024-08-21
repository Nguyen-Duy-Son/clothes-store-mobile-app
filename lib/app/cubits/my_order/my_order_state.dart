import 'package:clothes_store_mobile_app/app/models/order_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';

class MyOrderState extends Equatable{
  final Order order;
  const MyOrderState(
    this.order,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [order];
}
class MyOrderInitial extends MyOrderState{
  MyOrderInitial():super(Order(
    userId: "",
    id: "",
    productsActive: [],
    productsCanceled: [],
    productsCompleted: [],
  ));
}
class MyOrderLoading extends MyOrderState{
  MyOrderLoading():super(Order(
    userId: "",
    id: "",
    productsActive: [],
    productsCanceled: [],
    productsCompleted: [],
  ));
}
class MyOrderError extends MyOrderState{
  final String message;
  MyOrderError(this.message):super(Order(
    userId: "",
    id: "",
    productsActive: [],
    productsCanceled: [],
    productsCompleted: [],
  ));
}
class MyOrderLoaded extends MyOrderState{
  const MyOrderLoaded(super.order);
}