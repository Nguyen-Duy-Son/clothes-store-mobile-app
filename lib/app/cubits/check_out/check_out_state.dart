import 'package:clothes_store_mobile_app/app/models/check_out.dart';
import 'package:clothes_store_mobile_app/app/models/my_cart.dart';
import 'package:equatable/equatable.dart';
import '../../models/voucher_model.dart';



class CheckOutState extends Equatable{
  final double total;
  final List<Voucher> vouchers;
  final Voucher voucherApplied;
  final List<Shipping> shippings;
  final Shipping shipping;
  CheckOutState(this.total,this.vouchers,this.voucherApplied,this.shipping,this.shippings):super();
  @override
  // TODO: implement props
  List<Object?> get props => [total,vouchers,voucherApplied,shipping];
}
class initialMyCardState extends CheckOutState{
  initialMyCardState() : super(0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
      2022, 12, 12) , icon: "", timeStart: new DateTime(
      2022, 12, 12)),[]);
}
class MyCardLoading extends CheckOutState{
  MyCardLoading() : super(0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
      2022, 12, 12) , icon: "", timeStart: new DateTime(
      2022, 12, 12)),[]);
}
class MyCardError extends CheckOutState{
  final String message;
  MyCardError(this.message) :super(0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0),Shipping(id:"",name: "", cost: 0, timeEnd:new DateTime(
      2022, 12, 12) , icon: "", timeStart: new DateTime(
      2022, 12, 12)),[]);
}
class MyCardLoaded extends CheckOutState{
  MyCardLoaded(super.total,super.vouchers,super.isVoucherApplied,super.shipping,super.shippings);
}
class ProductLoading extends CheckOutState{
  ProductLoading(double total,List<Voucher>vouchers,Voucher voucher,Shipping shipping,List<Shipping>shippings) : super(total,vouchers,voucher,shipping,shippings);
}