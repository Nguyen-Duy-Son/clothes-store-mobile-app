import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_state.dart';
import 'package:clothes_store_mobile_app/app/datasource/network_services/product_service,dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit() : super(initialProductByCategoryState([]));

  Future<void> getProductByCategory(int categoryId) async {
    emit(ProductByCategoryLoading());
    try {
      final products = await ProductService.getProductsByCategoryId(categoryId);
      emit(ProductByCategoryLoaded(products));
    } catch (e) {
      emit(ProductByCategoryError(e.toString()));
    }
  }
}