import 'profile_img.dart';

class User {
  String? userName;
  String? email;
  ProfileImg? profileImg;
  String? id;

  User({this.userName, this.email, this.profileImg, this.id});

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json['userName'] as String?,
        email: json['email'] as String?,
        profileImg: json['profileImg'] == null
            ? null
            : ProfileImg.fromJson(json['profileImg'] as Map<String, dynamic>),
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'email': email,
        'profileImg': profileImg?.toJson(),
        '_id': id,
      };
}
