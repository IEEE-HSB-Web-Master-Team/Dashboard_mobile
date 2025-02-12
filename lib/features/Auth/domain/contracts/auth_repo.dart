import 'package:dash_board_ieee/core/network/api_result.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

abstract class AuthRepo {
  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request);
}
