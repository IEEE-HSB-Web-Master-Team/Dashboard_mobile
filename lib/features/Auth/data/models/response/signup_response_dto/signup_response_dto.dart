import 'user.dart';

class SignupResponseDto {
  bool? success;
  String? msg;
  User? user;

  SignupResponseDto({this.success, this.msg, this.user});

  factory SignupResponseDto.fromJson(Map<String, dynamic> json) {
    return SignupResponseDto(
      success: json['success'] as bool?,
      msg: json['msg'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'msg': msg,
        'user': user?.toJson(),
      };
}
