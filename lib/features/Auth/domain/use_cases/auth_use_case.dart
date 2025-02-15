import 'package:dash_board_ieee/core/network/api_result.dart';
import 'package:dash_board_ieee/features/Auth/domain/contracts/auth_repo.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import '../entities/request/login_request_entity.dart';
import '../entities/response/login_response_entity.dart';

@injectable
class AuthUseCase {
  final AuthRepo _authRepo;

  @factoryMethod
  const AuthUseCase(this._authRepo);

  Future<DataResult<LoginResponseEntity>> login(LoginRequestEntity request) {
    return _authRepo.login(request);
  }

  Future<DataResult<SignupResponseEntity>> signup(SignupReqestEtity request) {
    return _authRepo.signup(request);
  }
}
