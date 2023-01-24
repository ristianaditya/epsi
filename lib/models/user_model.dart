import 'dart:ffi';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? nik;
  String? roles;
  String? password;
  String? token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.nik,
      required this.roles,
      required this.password,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nik = json['nik'];
    roles = json['roles'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nik': nik,
      'roles': roles,
      'password': password,
      'token': token,
    };
  }
}
