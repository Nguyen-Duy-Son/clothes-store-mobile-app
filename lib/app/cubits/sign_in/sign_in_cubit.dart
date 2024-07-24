import 'package:clothes_store_mobile_app/app/cubits/sign_in/sign_in_state.dart';
import 'package:clothes_store_mobile_app/app/datasource/local/storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../datasource/network_services/auth_service.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  void signIn(String email, String password) async{
    emit(SignInLoading());
    try {
        var response = await AuthService.login(email, password);
        if(response["statusCode"]!=200){
          emit(SignInError(response["statusCode"].toString()));
        }
        else{
          Storage.setToken(response["token"]);
          emit(SignInLoaded(email));
        }
    } catch (e) {
      emit(SignInError(e.toString()));
    }
  }
}