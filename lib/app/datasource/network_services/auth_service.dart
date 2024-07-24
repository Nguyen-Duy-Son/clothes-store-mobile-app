import 'package:clothes_store_mobile_app/app/core/base/base_connect.dart';
import 'package:clothes_store_mobile_app/app/core/config/api_url.dart';
import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';

class AuthService {
  static Future<dynamic> login(String email, String password) async {
    try{
      final response = await BaseConnect.onRequest(
        ApiUrl.loginLocal,
        RequestMethod.POST,
        body: {"email": email, "password": password},
      );
      if(response["statusCode"]==200){
        print(response["data"]);
        Storage.setToken(response["data"]["access"]["token"]);
        return response["data"];
      }
      return response["statusCode"];
    }
    catch(e){
      print(e);
    }
  }
}
