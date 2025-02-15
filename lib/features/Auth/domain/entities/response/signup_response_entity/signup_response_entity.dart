import 'user.dart';

class SignupResponseEntity {
  bool? success;
  String? msg;
  User? user;

  SignupResponseEntity({this.success, this.msg, this.user});

}
