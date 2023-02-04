import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int _currentIndex = 0;
  String _idBerita = "";

  int get currentIndex => _currentIndex;
  String get idBerita => _idBerita;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  set idBerita(String idBerita) {
    _idBerita = idBerita;
    notifyListeners();
  }
}
