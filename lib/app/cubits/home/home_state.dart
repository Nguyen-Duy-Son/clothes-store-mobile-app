import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';
import '../../models/wish_list_model.dart';

class HomeState extends Equatable {
  final List<Product> products;
  final List<Category> categories;
  const HomeState(this.products, this.categories);

  @override
  // TODO: implement props
  List<Object?> get props => [products, categories];
}
class initialHomeState extends HomeState {
  initialHomeState(List<Product> products,List<Category>categories) : super(products,categories);
}
class HomeLoading extends HomeState {
  HomeLoading() : super([],[]);
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message,) : super([],[]);
}
class HomeLoaded extends HomeState {
  HomeLoaded(List<Product> products,List<Category>categories) : super(products,categories);
}