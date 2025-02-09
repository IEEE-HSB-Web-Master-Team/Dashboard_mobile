import '../../domain/entities/request/login_request_entity.dart';
import '../../domain/entities/response/login_response_entity.dart';
import '../models/request/login_request_dto.dart';
import '../models/response/login_response_dto.dart';

class AuthMapper {
  static LoginRequestDto mapLoginRequestToDto(LoginRequestEntity entity) {
    return LoginRequestDto(entity.email, entity.password);
  }

  static LoginResponseEntity mapResponseToEntity(LoginResponseDto dto) {
    return LoginResponseEntity(dto.message, dto.token);
  }
}
