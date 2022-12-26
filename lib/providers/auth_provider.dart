import 'package:epsi/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:epsi/models/user_model.dart';

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
    required String kader,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        nik: nik,
        email: email,
        kader: kader,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(name);
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
}
