import 'package:either_dart/either.dart';
import '../../../../core/erorr/failure.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity request);
}
