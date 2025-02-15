import 'package:dash_board_ieee/core/network/api_result.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

abstract class AuthRepo {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
  Future<DataResult<SignupResponseEntity>> signup(SignupReqestEtity request);
}
