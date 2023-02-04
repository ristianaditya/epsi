import 'package:flutter/material.dart';
import 'package:epsi/models/posyandu_model.dart';
import 'package:epsi/models/kader_model.dart';
import 'package:epsi/services/posyandu_service.dart';

class PosyanduProvider with ChangeNotifier {
  List<PosyanduModel> _posyandu = [];
  List<PosyanduModel> get posyandu => _posyandu;

  List<KaderModel> _kader = [];
  List<KaderModel> get kader => _kader;

  PosyanduModel? _posyanduDetail;
  PosyanduModel? get posyanduDetail => _posyanduDetail;

  set kader(List<KaderModel> kader) {
    _kader = kader;
    notifyListeners();
  }

  set posyanduDetail(PosyanduModel? posyanduDetail) {
    _posyanduDetail = posyanduDetail;
    notifyListeners();
  }

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

  Future<bool> getPosyanduDetail({required String? idPosyandu}) async {
    try {
      PosyanduModel posyanduDetail =
          await PosyanduService().getPosyanduDetail(idPosyandu: idPosyandu);

      _posyanduDetail = posyanduDetail;
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getKader({required String? idPosyandu}) async {
    try {
      List<KaderModel> kader =
          await PosyanduService().getKader(idPosyandu: idPosyandu);

      _kader = kader;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
