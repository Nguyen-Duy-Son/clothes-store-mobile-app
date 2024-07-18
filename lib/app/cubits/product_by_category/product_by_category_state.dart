import 'package:equatable/equatable.dart';

import '../../models/product_model.dart';

class ProductByCategoryState extends Equatable{
  final List<Product> products;
  ProductByCategoryState(this.products):super();
  @override
  // TODO: implement props
  List<Object?> get props => [products];
}
class initialProductByCategoryState extends ProductByCategoryState {
  initialProductByCategoryState(List<Product> products) : super(products);
}
class ProductByCategoryLoading extends ProductByCategoryState {
  ProductByCategoryLoading() : super([]);
}
class ProductByCategoryError extends ProductByCategoryState {
  final String message;
  ProductByCategoryError(this.message,) : super([]);
}
class ProductByCategoryLoaded extends ProductByCategoryState {
  ProductByCategoryLoaded(List<Product> products) : super(products);
}