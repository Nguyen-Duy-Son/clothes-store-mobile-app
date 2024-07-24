import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final String email;
  SignInState(
    this.email,
  ): super();
  @override
  List<Object> get props => [email];
}
class SignInInitial extends SignInState {
  SignInInitial() : super("");
}
class SignInLoading extends SignInState {
  SignInLoading() : super("");
}
class SignInError extends SignInState {
  final String message;
  SignInError(this.message) : super("");
}
class SignInLoaded extends SignInState {
  SignInLoaded(String email) : super(email);
}