import 'package:clothes_store_mobile_app/app/cubits/home/home_state.dart';
import 'package:clothes_store_mobile_app/app/models/category_model.dart';
import 'package:clothes_store_mobile_app/app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../datasource/network_services/product_service,dart.dart';


class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(initialHomeState(const [],const[]));
  Future<void> getHome() async {
    emit(HomeLoading());
    try {
      List<Product> products = await ProductService.getProducts();
      List<Category> categories = cates;
      emit(HomeLoaded(products, categories));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
final List<Category> cates = [
  {
    'id': 1,
    'name': 'tshirt',
    'image': 'assets/icons/tshirt.svg',
  },
  {
    'id': 2,
    'name': 'short',
    'image': 'assets/icons/short.svg',
  },
  {
    'id': 3,
    'name': 'jeans',
    'image': 'assets/icons/jeans.svg',
  },
  {
    'id': 4,
    'name': 'jacket',
    'image': 'assets/icons/jacket.svg',
  },
  {
    'id': 5,
    'name': 'shoe',
    'image': 'assets/icons/shoe.svg',
  },
  {
    'id': 6,
    'name': 'dress',
    'image': 'assets/icons/dress.svg',
  },
].map((item) => Category.fromJson(item)).toList();