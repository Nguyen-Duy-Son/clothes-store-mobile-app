import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/check_out.dart';
import '../../models/product_cart.dart';
import '../../models/my_cart.dart';
import '../../models/voucher_model.dart';
import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(initialMyCardState());

  Future<void> getCheckOut(double totalCost) async {
    emit(MyCardLoading());
    try {
      double total = totalCost;
      List<Voucher> vouchersList = vouchers;
      List<Shipping> shippingsList = shippingLists;
      emit(MyCardLoaded(
          total,
          vouchersList,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),shippingsList),);
    } catch (e) {
      emit(MyCardError(e.toString()));
    }
  }

  Future<void> applyVoucher(String code) async {
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
        emit(MyCardLoaded(total, state.vouchers, voucher,Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),state.shippings));
      } else {
        emit(MyCardError('Voucher not found'));
      }
    } catch (e) {
      emit(MyCardLoaded(
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),state.shippings));
    }
  }
  Future<void> appVoucherShipping(Shipping ship) async{
    try {
      double total = state.total;
      if (state.shipping.id == ship.id) {
        return;
      } else if (state.shipping.id.isNotEmpty&&state.shipping.name.isNotEmpty) {
        total = total + state.shipping.cost;
        emit(
            MyCardLoaded(total, state.vouchers, state.voucherApplied, ship, state.shippings)
        );
      }
    } catch (e) {
      emit(MyCardLoaded(
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),state.shippings));
    }
  }
}
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
final jsonShipping=[
  {
    "id": "1",
    "name": "Tiết Kiệm",
    "cost": 5.99,
    "timeEnd": "2024-07-30T17:00:00Z",
    "icon": "assets/icons/shippingbox.svg",
    "timeStart": "2024-07-25T08:00:00Z"
  },
  {
    "id": "2",
    "name": "Nhanh",
    "cost": 15.99,
    "timeEnd": "2024-07-28T12:00:00Z",
    "icon": "assets/icons/local-shipping.svg",
    "timeStart": "2024-07-25T08:00:00Z"
  },
  {
    "id": "3",
    "name": "Hoả Tốc",
    "cost": 25.99,
    "timeEnd": "2024-07-26T08:00:00Z",
    "icon": "assets/icons/shipping-fast.svg",
    "timeStart": "2024-07-25T20:00:00Z"
  }
];
final shippingLists = jsonShipping.map((e) => Shipping.fromJson(e)).toList();