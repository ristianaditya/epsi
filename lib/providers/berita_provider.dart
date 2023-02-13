import 'package:epsi/services/berita_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:epsi/models/berita_model.dart';

class BeritaProvider with ChangeNotifier {
  List<BeritaModel> _berita = [];
  List<BeritaModel> get berita => _berita;

  set berita(List<BeritaModel> berita) {
    _berita = berita;
    notifyListeners();
  }

  Future<void> getBerita() async {
    try {
      List<BeritaModel> berita = await BeritaService().getBerita();

      _berita = berita;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
