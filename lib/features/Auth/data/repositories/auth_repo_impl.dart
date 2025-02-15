import 'package:dash_board_ieee/features/Auth/data/data_sources/contracts/auth_online_data_source.dart';
import 'package:dash_board_ieee/features/Auth/domain/contracts/auth_repo.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/login_request_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/login_response_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_result.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthOnlineDataSource _onlineDataSource;

  @factoryMethod
  const AuthRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return await _onlineDataSource.login(request);
  }

  @override
  Future<DataResult<SignupResponseEntity>> signup(SignupReqestEtity request)async {
    return await _onlineDataSource.signup(request);
   
  }
}
