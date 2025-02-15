import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';

import '../../domain/entities/request/login_request_entity.dart';

sealed class AuthActions {}

class LoginAction extends AuthActions {
  final LoginRequestEntity request;

  LoginAction(this.request);
}
class SignupAction extends AuthActions {
  final SignupReqestEtity request;

  SignupAction(this.request);
}
