import '../../domain/entities/request/login_request_entity.dart';

sealed class AuthActions {}

class LoginAction extends AuthActions {
  final LoginRequestEntity request;

  LoginAction(this.request);
}
