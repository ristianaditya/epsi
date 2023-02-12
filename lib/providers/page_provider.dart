import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentIndex = 0;
  String _idBerita = "";
  String _idAnak = "";
  String _idRaport = "";

  int get currentIndex => _currentIndex;
  String get idBerita => _idBerita;
  String get idAnak => _idAnak;
  String get idRaport => _idRaport;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set idAnak(String idAnak) {
    _idAnak = idAnak;
    notifyListeners();
  }

  set idBerita(String idBerita) {
    _idBerita = idBerita;
    notifyListeners();
  }

  set idRaport(String idRaport) {
    _idRaport = idRaport;
    notifyListeners();
  }
}
