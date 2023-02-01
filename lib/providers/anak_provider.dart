import 'package:epsi/services/anak_service.dart';
import 'package:flutter/cupertino.dart';

import 'package:epsi/models/anak_model.dart';

class AnakProvider with ChangeNotifier {
  AnakModel? _anak;
  AnakModel? get anak => _anak;

  set anak(AnakModel? anak) {
    _anak = anak;
    notifyListeners();
  }

  Future<bool> createAnak({
    required String? name,
    required String? nik,
    required String? tempat_lahir,
    required String? jenis_kelamin,
    required DateTime? tanggal_lahir,
    required String? id,
    required String? token,
  }) async {
    try {
      AnakModel anak = await AnakService().createAnak(
        name: name,
        nik: nik,
        tempat_lahir: tempat_lahir,
        jenis_kelamin: jenis_kelamin,
        tanggal_lahir: tanggal_lahir,
        id: id,
        token: token,
      );
      _anak = anak;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
