part of 'auth_view_model_cubit.dart';

@immutable
sealed class AuthViewModelState {}

final class AuthViewModelInitial extends AuthViewModelState {}

final class LoginLoadingState extends AuthViewModelState {}

final class LoginSuccessState extends AuthViewModelState {
  final LoginResponseEntity response;

  LoginSuccessState(this.response);
}

final class LoginErrorState extends AuthViewModelState {
  final ErrorModel errorMessage;

  LoginErrorState(this.errorMessage);
}
final class SignupLoadingState extends AuthViewModelState {}
final class SignupSuccessState extends AuthViewModelState {
  final SignupResponseEntity response;

  SignupSuccessState(this.response);
}
final class SignupErrorState extends AuthViewModelState {
  final ErrorModel errorMessage;

  SignupErrorState(this.errorMessage);
}
