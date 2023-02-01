import 'package:flutter/material.dart';
import 'package:epsi/models/posyandu_model.dart';
import 'package:epsi/services/posyandu_service.dart';

class PosyanduProvider with ChangeNotifier {
  List<PosyanduModel> _posyandu = [];
  List<PosyanduModel> get posyandu => _posyandu;

  set posyandu(List<PosyanduModel> posyandu) {
    _posyandu = posyandu;
    notifyListeners();
  }

  Future<void> getPosyandu({required String? token}) async {
    try {
      List<PosyanduModel> posyandu =
          await PosyanduService().getPosyandu(token: token);
      _posyandu = posyandu;
    } catch (e) {
      print(e);
    }
  }
}
