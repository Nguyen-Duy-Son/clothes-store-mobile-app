import 'package:clothes_store_mobile_app/app/models/shipping_model.dart';
import 'package:equatable/equatable.dart';

import '../../models/pay_method_model.dart';
import '../../models/voucher_model.dart';

class CheckOutState extends Equatable {
  final double total;
  final List<Voucher> vouchers;
  final Voucher voucherApplied;
  final List<Shipping> shippings;
  final Shipping shipping;
  final List<PayMethod> payMethods;
  final PayMethod payMethod;

  const CheckOutState(this.total, this.vouchers, this.voucherApplied,
      this.shipping, this.shippings, this.payMethods, this.payMethod)
      : super();

  @override
  // TODO: implement props
  List<Object?> get props => [
        total,
        vouchers,
        voucherApplied,
        shipping,
        shippings,
        payMethods,
        payMethod
      ];
}

class initialCheckOutState extends CheckOutState {
  initialCheckOutState()
      : super(
            0.0,
            [],
            Voucher(
                id: "",
                code: "",
                expiryDate: new DateTime(2022, 12, 12),
                discount: 0.0),
            Shipping(
                id: "",
                name: "",
                cost: 0.0,
                timeEnd: new DateTime(2022, 12, 12),
                icon: "",
                timeStart: new DateTime(2022, 12, 12)),
            [],
            [],
            PayMethod(name: "", icon: "", id: "", totalMoney: 0.0));
}

class CheckOutLoading extends CheckOutState {
  CheckOutLoading()
      : super(
            0.0,
            [],
            Voucher(
                id: "",
                code: "",
                expiryDate: new DateTime(2022, 12, 12),
                discount: 0),
            Shipping(
                id: "",
                name: "",
                cost: 0,
                timeEnd: new DateTime(2022, 12, 12),
                icon: "",
                timeStart: new DateTime(2022, 12, 12)),
            [],
            [],
            PayMethod(name: "", icon: "", id: "", totalMoney: 0.0));
}

class CheckOutError extends CheckOutState {
  final String message;

  CheckOutError(this.message)
      : super(
            0.0,
            [],
            Voucher(
                id: "",
                code: "",
                expiryDate: new DateTime(2022, 12, 12),
                discount: 0.0),
            Shipping(
                id: "",
                name: "",
                cost: 0.0,
                timeEnd: new DateTime(2022, 12, 12),
                icon: "",
                timeStart: new DateTime(2022, 12, 12)),
            [],
            [],
            PayMethod(name: "", icon: "", id: "", totalMoney: 0.0));
}

class CheckOutLoaded extends CheckOutState {
  const CheckOutLoaded(
      double total,
      List<Voucher> vouchers,
      Voucher voucherApplied,
      Shipping shipping,
      List<Shipping> shippings,
      List<PayMethod> payMethods,
      PayMethod payMethod)
      : super(total, vouchers, voucherApplied, shipping, shippings, payMethods,
            payMethod);
}
