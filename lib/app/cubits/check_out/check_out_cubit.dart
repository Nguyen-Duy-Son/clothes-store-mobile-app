import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/shipping_model.dart';
import '../../models/pay_method_model.dart';
import '../../models/voucher_model.dart';
import 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit() : super(initialCheckOutState());

  Future<void> getCheckOut(double totalCost) async {
    emit(CheckOutLoading());
    try {
      double total = totalCost;
      List<Voucher> vouchersList = vouchers;
      List<Shipping> shippings = shippingLists;
      List<PayMethod> payMethodsList = payMethods;
      emit(CheckOutLoaded(
          total,
          vouchersList,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),shippings[0],shippings,payMethodsList, payMethodsList[2] ));
    } catch (e) {
      emit(CheckOutError("lỗi$e"));
    }
  }

  Future<void> applyVoucher(String code) async {
    try {
      double total = state.total;
      if (state.voucherApplied.code == code) {
        return;
      }
      List<Voucher> vouchersList = state.vouchers;
      final voucher =
          vouchersList.firstWhere((element) => element.code == code);
      if (voucher.id.isNotEmpty && voucher.code.isNotEmpty) {
        // total = total - voucher.discount;
        emit(CheckOutLoaded(total, state.vouchers, voucher,state.shipping,state.shippings,state.payMethods,state.payMethod));
      } else {
        emit(CheckOutError('Voucher not found'));
      }
    } catch (e) {
      emit(CheckOutLoaded(
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),state.shipping,state.shippings,state.payMethods,state.payMethod));
    }
  }
  Future<void> appVoucherShipping(Shipping ship) async{
    try {
      double total = state.total;
      if (state.shipping.id == ship.id) {
        return;
      } else if (state.shipping.id.isNotEmpty&&state.shipping.name.isNotEmpty) {
        // total = total + ship.cost;
        emit(
            CheckOutLoaded(total, state.vouchers, state.voucherApplied, ship, state.shippings,state.payMethods,state.payMethod)
        );
      }
    } catch (e) {
      emit(CheckOutLoaded(
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),state.shippings,state.payMethods,state.payMethod));
    }
  }
  Future<void> updatePayMethod(PayMethod payMethod) async{
    try {
      if (state.payMethod.id == payMethod.id) {
        return;
      } else if (state.payMethod.id.isNotEmpty&&state.payMethod.name.isNotEmpty) {
        emit(
            CheckOutLoaded(state.total, state.vouchers, state.voucherApplied, state.shipping, state.shippings,state.payMethods,payMethod)
        );
      }
    } catch (e) {
      emit(CheckOutLoaded(
          state.total,
          state.vouchers,
          Voucher(
              id: "",
              code: "",
              expiryDate: new DateTime(2022, 12, 12),
              discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
          2022, 12, 12) , icon: "", timeStart: new DateTime(
          2022, 12, 12)),state.shippings,state.payMethods,state.payMethod));
    }
  }
  Future<void> payment() async{
    try {
      emit(initialCheckOutState());
    } catch (e) {
      emit(CheckOutError("lỗi$e"));
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
final List<Map<String, dynamic>> jsonShipping=[
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
List<Map<String, dynamic>> jsonList = [
  {"id":"1","name": 'Thanh toán bằng thẻ', "icon": 'assets/icons/pay-card.svg', "totalMoney": 300.0},
  {"id":"2","name": 'Thanh toán qua PayPal', "icon": 'assets/icons/pay-paypal.svg',"totalMoney": 200.0},
  {"id":"3","name": 'Thanh toán tại nhà', "icon": 'assets/icons/pay-home.svg',"totalMoney": 0.0},
  {"id":"4","name": 'Thanh toán bằng Apple Pay', "icon": 'assets/icons/logo-apple.svg',"totalMoney": 500.0},
  {"id":"5","name": 'Thanh toán bằng Goggle Pay', "icon": 'assets/icons/logo-goggle.svg',"totalMoney": 100.0},
];

List<PayMethod> payMethods = jsonList
    .map((jsonItem) => PayMethod.fromJson(jsonItem))
    .toList();