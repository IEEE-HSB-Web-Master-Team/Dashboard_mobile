import 'package:dash_board_ieee/features/Auth/domain/entities/request/login_request_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/login_response_entity.dart';
import 'package:either_dart/either.dart';

import '../../../../../core/erorr/failure.dart';

abstract class LoginOnlineDataSource {
  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity request);
}
