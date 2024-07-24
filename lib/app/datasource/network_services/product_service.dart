import 'package:clothes_store_mobile_app/app/core/base/base_connect.dart';
import 'package:clothes_store_mobile_app/app/core/config/api_url.dart';

import '../../models/product_model.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    var response = await BaseConnect.onRequest(ApiUrl.getProducts, RequestMethod.GET);
    if (response is List) {
      response = response.map<Product>((json) => Product.fromJson(json)).toList();
      return response as List<Product>;
    } else {
      throw Exception('Failed to load products');
    }
  }
  static Future<List<Product>> getProductsByCategoryId(int id) async {
    var response = await BaseConnect.onRequest(ApiUrl.getProducts, RequestMethod.GET);
    if (response is List) {
      response = response.where((element) => element['categoryId'] == id).toList();
      response = response.map<Product>((json) => Product.fromJson(json)).toList();
      print(response.length);
      return response as List<Product>;
    } else {
      throw Exception('Failed to load products');
    }
  }
}