import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_model.dart';
import '../../models/product_card.dart';
import '../../models/voucher_model.dart';
import 'my_card_state.dart';

class MyCardCubit extends Cubit<MyCardState> {
  MyCardCubit() : super(initialMyCardState());

  Future<void> getCard() async {
    emit(MyCardLoading());
    try {
      final carts = cart;
      final double total = carts.listProducts!.fold(
          0,
          (previousValue, element) =>
              previousValue +
              element.price.toDouble() * element.count.toDouble());
      final List<Voucher> vouchersList = vouchers;
      emit(MyCardLoaded(
          carts,
          total,
          vouchersList,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0)));
    } catch (e) {
      emit(MyCardError(e.toString()));
    }
  }

  Future<void> updateCard(ProductCart p, int option) async {
    // emit(ProductLoading(state.cart, state.total,state.vouchers,false));
    try {
      final carts = cart;
      double total = state.total;
      List<Voucher> vouchersList = state.vouchers;
      final index = carts.listProducts!
          .indexWhere((element) => element.productId == p.productId);
      if (option == 1) {
        if (index == -1) {
          carts.listProducts!.add(p);
        } else {
          carts.listProducts![index].count++;
        }
        total += p.price.toDouble();
      } else if (option == 0) {
        if (index != -1) {
          if (carts.listProducts![index].count > 1) {
            carts.listProducts![index].count--;
          } else {
            carts.listProducts!.removeAt(index);
          }
          total -= p.price.toDouble();
        }
      } else if (option == 3) {
        if (index != -1) {
          carts.listProducts!.removeAt(index);
          total -= p.price.toDouble() * p.count.toDouble();
        }
      }
      emit(MyCardLoaded(
          carts,
          total,
          vouchersList,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0)));
    } catch (e) {
      emit(MyCardError(e.toString()));
    }
  }

  Future<void> applyVoucher(String code) async {
    print("alo");
    try {
      double total = state.total;
      if (state.voucherApplied.code == code) {
        return;
      } else if (state.voucherApplied.code.isNotEmpty&&state.voucherApplied.id.isNotEmpty) {
        total = total + state.voucherApplied.discount;
      }
      List<Voucher> vouchersList = state.vouchers;
      final voucher =
          vouchersList.firstWhere((element) => element.code == code);
      if (voucher.id.isNotEmpty && voucher.code.isNotEmpty) {
        total = total - voucher.discount;
        emit(MyCardLoaded(state.cart, total, state.vouchers, voucher));
      } else {
        emit(MyCardError('Voucher not found'));
      }
    } catch (e) {
      emit(MyCardLoaded(
          state.cart,
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0)));
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
final Cart cart = Cart.fromJson(jsonCart);
final List<Map<String, dynamic>> jsonVoucher = [
  {
    "id": "voucher1",
    "code": "CODE1",
    "expiryDate": "2023-12-31T00:00:00.000Z",
    "discount": 10.0
  },
  {
    "id": "voucher2",
    "code": "CODE2",
    "expiryDate": "2024-01-31T00:00:00.000Z",
    "discount": 15.0
  },
  {
    "id": "voucher3",
    "code": "CODE3",
    "expiryDate": "2024-02-28T00:00:00.000Z",
    "discount": 20.0
  },
  {
    "id": "voucher4",
    "code": "CODE4",
    "expiryDate": "2024-09-28T00:00:00.000Z",
    "discount": 20.0
  },
  {
    "id": "voucher5",
    "code": "CODE5",
    "expiryDate": "2024-08-28T00:00:00.000Z",
    "discount": 100.0
  }
];
final List<Voucher> vouchers =
    jsonVoucher.map((e) => Voucher.fromJson(e)).toList();
