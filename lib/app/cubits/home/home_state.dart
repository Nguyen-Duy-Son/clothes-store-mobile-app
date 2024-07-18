import 'package:equatable/equatable.dart';

import '../../models/category_model.dart';
import '../../models/product_model.dart';

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
// class HomeState extends Equatable {
//   final List<Product> products;
//   final List<Category> categories;
//   HomeState(this.products, this.categories);
//
//   @override
//   List<Object?> get props => [products, categories];
// }
//
// class initialHomeState extends HomeState {
//   initialHomeState() : super([], []);
// }
//
// class HomeProductsLoading extends HomeState {
//   HomeProductsLoading(List<Category> categories) : super([], categories);
// }
//
// class HomeCategoriesLoading extends HomeState {
//   HomeCategoriesLoading(List<Product> products) : super(products, []);
// }
//
// class HomeProductsError extends HomeState {
//   final String message;
//   HomeProductsError(this.message, List<Category> categories) : super([], categories);
// }
//
// class ProductsLoaded extends HomeState {
//   ProductsLoaded(List<Product> products, List<Category> categories) : super(products, categories);
// }
//
// class CategoriesLoaded extends HomeState {
//   CategoriesLoaded(List<Product> products, List<Category> categories) : super(products, categories);
// }