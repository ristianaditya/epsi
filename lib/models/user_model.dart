import 'dart:ffi';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? nik;
  String? kader;
  String? password;
  String? profilePhotoUrl;
  String? token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.nik,
      required this.kader,
      required this.password,
      required this.profilePhotoUrl,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nik = json['nik'];
    kader = json['kader'];
    password = json['password'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nik': nik,
      'kader': kader,
      'password': password,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
