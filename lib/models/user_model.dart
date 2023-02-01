import 'dart:ffi';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? nik;
  String? alamat;
  String? jenis_kelamin;
  String? posyandu;
  String? roles;
  String? password;
  String? token;
  bool? verifikasi;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.nik,
      required this.roles,
      required this.alamat,
      required this.jenis_kelamin,
      required this.posyandu,
      required this.password,
      required this.verifikasi,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    nik = json['nik'];
    roles = json['roles'];
    alamat = json['alamat'];
    jenis_kelamin = json['jenis_kelamin'];
    posyandu = json['posyandu'];
    password = json['password'];
    token = json['token'];
    verifikasi = json['verifikasi'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'nik': nik,
      'roles': roles,
      'alamat': alamat,
      'jenis_kelamin': jenis_kelamin,
      'posyandu': posyandu,
      'password': password,
      'token': token,
      'verifikasi': verifikasi,
    };
  }
}
