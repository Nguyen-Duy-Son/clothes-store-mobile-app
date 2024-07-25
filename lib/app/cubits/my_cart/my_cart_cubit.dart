
import 'package:clothes_store_mobile_app/app/models/product_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/my_cart.dart';
import 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState>{
  MyCartCubit() : super(MyCartInitial());
  void getCart(){
    emit(MyCartLoading());
    try{
      final cart = myCart;
      emit(MyCartLoaded(cart));
    }catch(e){
      emit(MyCartError(e.toString()));
    }
  }
  Future<void> updateCart(ProductCart p, int option) async {
    // emit(ProductLoading(state.cart, state.total,state.vouchers,false));
    try {
      MyCart cart = state.cart;
      final index = cart.listProducts!
          .indexWhere((element) => element.productId == p.productId);
      if (option == 1) {
        if (index == -1) {
          cart.listProducts!.add(p);
        } else {
          cart.listProducts![index].count++;
        }
      } else if (option == 0) {
        if (index != -1) {
          if (cart.listProducts![index].count > 1) {
            cart.listProducts![index].count--;
          } else {
            cart.listProducts!.removeAt(index);
          }
        }
      } else if (option == 3) {
        if (index != -1) {
          cart.listProducts!.removeAt(index);
        }
      }
      emit(MyCartLoaded(cart));
    } catch (e) {
      emit(MyCartError(e.toString()));
    }
  }
}
final Map<String, dynamic> jsonCart = {
  "userId": "user123",
  "listProducts": [
    {
      "productId": "1",
      "count": 2,
      "name": "Product 1",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17,
      "size": "M"
    },
    {
      "productId": "2",
      "count": 3,
      "name": "Product 2",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17,
      "size": "L"
    },
    {
      "productId": "3",
      "count": 10,
      "name": "Product 2",
      "image": "https://loremflickr.com/640/480/fashion",
      "price": 17,
      "size": "XXL"
    },
  ]
};
final MyCart myCart = MyCart.fromJson(jsonCart);