import 'package:equatable/equatable.dart';
import '../../models/my_cart.dart';

class MyCartState extends Equatable{
  final MyCart cart;
  const MyCartState(this.cart):super();

  @override
  List<Object> get props => [cart];
}
class MyCartInitial extends MyCartState{
  MyCartInitial() : super(MyCart(userId: "", listProducts: []));
}
class MyCartLoading extends MyCartState{
  MyCartLoading() : super(MyCart(userId: "", listProducts: []));
}
class MyCartError extends MyCartState{
  final String message;
  MyCartError(this.message) : super(MyCart(userId: "", listProducts: []));
}
class MyCartLoaded extends MyCartState{
  const MyCartLoaded(super.cart) ;
}