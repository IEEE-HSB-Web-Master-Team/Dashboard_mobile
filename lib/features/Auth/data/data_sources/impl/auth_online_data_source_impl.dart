import 'package:dash_board_ieee/core/network/api_execute.dart';
import 'package:dash_board_ieee/core/network/api_result.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/login_request_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/login_response_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/api/api_manger.dart';
import '../../mapper/auth_mapper.dart';
import '../contracts/auth_online_data_source.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final NewApiManger _apiManger;

  @factoryMethod
  AuthOnlineDataSourceImpl(this._apiManger);

  @override
  Future<DataResult<LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    return executeApi(() async {
      final response =
          await _apiManger.login(AuthMapper.mapLoginRequestToDto(request));
      return AuthMapper.mapResponseToEntity(response);
    });
  }

  @override
  Future<DataResult<SignupResponseEntity>> signup(SignupReqestEtity request) {
    return executeApi(() async {
      final response =
          await _apiManger.sinup(AuthMapper.mapSignupRequestToDto(request));
      return AuthMapper.mapSignupResponseToEntity(response);
    });
    
  }
}
