import 'package:dash_board_ieee/features/Auth/domain/contracts/auth_repo.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/erorr/failure.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  @factoryMethod
  const AuthUseCase(this._authRepo);

  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity request) {
    return _authRepo.login(request);
  }
}
