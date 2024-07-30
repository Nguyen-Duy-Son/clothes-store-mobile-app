import 'package:clothes_store_mobile_app/app/core/base/base_connect.dart';
import 'package:clothes_store_mobile_app/app/core/config/api_url.dart';

import '../../models/shipping_model.dart';

// class CartService {
//   static Future<dynamic> getCart() async {
//     var response = await BaseConnect.onRequest(ApiUrl.getMyCart, RequestMethod.GET);
//     if (response is Map) {
//       response = Cart.fromJson(response as Map<String, dynamic>);
//       return response as Cart;
//     } else {
//       throw Exception('Failed to get cart');
//     }
//   }
//   static Future<dynamic> updateCart(String cardId, String productId, int option) async {
//     var response = await BaseConnect.onRequest(ApiUrl.updateCart, RequestMethod.POST, body: {
//       'productId': productId,
//     }, queryParam: {
//         "id": cardId,
//       }
//     );
//     return response["statusCode"];
//   }
// }