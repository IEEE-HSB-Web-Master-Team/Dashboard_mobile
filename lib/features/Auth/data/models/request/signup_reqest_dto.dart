class SignupReqestDto {
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  String? gender;
  String? role;

  SignupReqestDto({
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.gender,
    this.role,
  });

  factory SignupReqestDto.fromJson(Map<String, dynamic> json) {
    return SignupReqestDto(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      confirmPassword: json['confirmPassword'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'phone': phone,
        'gender': gender,
        'role': role,
      };
}
