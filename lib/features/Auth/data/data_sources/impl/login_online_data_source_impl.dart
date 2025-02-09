import 'package:dash_board_ieee/core/api/api_manger.dart';
import 'package:dash_board_ieee/core/erorr/failure.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/login_request_entity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/login_response_entity.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../mapper/auth_mapper.dart';
import '../contracts/login_online_data_source.dart';

@Injectable(as: LoginOnlineDataSource)
class LoginOnlineDataSourceImpl implements LoginOnlineDataSource {
  final NewApiManger _apiManger;

  @factoryMethod
  LoginOnlineDataSourceImpl(this._apiManger);

  @override
  Future<Either<Failure, LoginResponseEntity>> login(
      LoginRequestEntity request) async {
    try {
      final requestDto = AuthMapper.mapLoginRequestToDto(request);
      final responseDto = await _apiManger.login(requestDto);

      if (responseDto.success == true) {
        final loginResponseEntity = AuthMapper.mapResponseToEntity(responseDto);
        return Right(loginResponseEntity);
      } else {
        return Left(ServerFailure(responseDto.message ?? "Login failed"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(ServerFailure.fromBadResponse(
            e.response!.statusCode!, e.response!.data));
      } else {
        return Left(ServerFailure.fromServer(e));
      }
    } catch (e) {
      return Left(ServerFailure("Oops! Something went wrong"));
    }
  }
}
