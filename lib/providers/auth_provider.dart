import 'dart:ffi';

import 'package:epsi/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:epsi/models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  set user(UserModel? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String nik,
    required String email,
    required String roles,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        nik: nik,
        email: email,
        roles: roles,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update({
    required String? jenis_kelamin,
    required String? alamat,
    required String? posyandu,
    required String? token,
    required String? id,
  }) async {
    try {
      UserModel user = await AuthService().update(
        alamat: alamat,
        jenis_kelamin: jenis_kelamin,
        posyandu: posyandu,
        token: token,
        id: id,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> verifikasi({
    required bool? verifikasi,
    required String? id,
    required String? token,
  }) async {
    try {
      UserModel user = await AuthService().verifikasi(
        verifikasi: verifikasi,
        id: id,
        token: token,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
