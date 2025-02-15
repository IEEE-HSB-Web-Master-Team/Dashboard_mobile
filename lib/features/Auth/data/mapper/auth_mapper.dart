import 'package:dash_board_ieee/features/Auth/data/models/request/signup_reqest_dto.dart';
import 'package:dash_board_ieee/features/Auth/data/models/response/signup_response_dto/signup_response_dto.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/request/signup_reqest_etity.dart';
import 'package:dash_board_ieee/features/Auth/domain/entities/response/signup_response_entity/signup_response_entity.dart';

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

  static SignupReqestDto mapSignupRequestToDto(SignupReqestEtity entity) {
    return SignupReqestDto(
      email: entity.email,
      password: entity.password,
      userName: entity.userName,
      confirmPassword: entity.confirmPassword,
      gender: entity.gender,
      phone: entity.phone,
      role: entity.role,
    );
  }
  static SignupResponseEntity mapSignupResponseToEntity(SignupResponseDto dto) {
    return SignupResponseEntity(msg: dto.msg, success: dto.success);
  }


  
}
