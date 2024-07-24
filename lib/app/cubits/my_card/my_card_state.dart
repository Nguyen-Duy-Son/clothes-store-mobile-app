import 'package:clothes_store_mobile_app/app/models/cart_model.dart';
import 'package:equatable/equatable.dart';
import '../../models/voucher_model.dart';


class MyCardState extends Equatable{
  final Cart cart;
  final double total;
  final List<Voucher> vouchers;
  final Voucher voucherApplied;
  MyCardState(this.cart,this.total,this.vouchers,this.voucherApplied):super();
  @override
  // TODO: implement props
  List<Object?> get props => [cart,total,vouchers,voucherApplied];
}
class initialMyCardState extends MyCardState{
  initialMyCardState() : super(Cart(userId: "", listProducts: []),0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0));
}
class MyCardLoading extends MyCardState{
  MyCardLoading() : super(Cart(userId: "", listProducts: []),0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0));
}
class MyCardError extends MyCardState{
  final String message;
  MyCardError(this.message) : super(Cart(userId: "", listProducts: []),0.0,[],Voucher(id: "", code: "", expiryDate: new DateTime(
      2022, 12, 12),discount: 0));
}
class MyCardLoaded extends MyCardState{
  MyCardLoaded(super.cart,super.total,super.vouchers,super.isVoucherApplied);
}
class ProductLoading extends MyCardState{
  ProductLoading(Cart cart, double total,List<Voucher>vouchers,Voucher voucher) : super(cart, total,vouchers,voucher);
}