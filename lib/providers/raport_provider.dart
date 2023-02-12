import 'package:epsi/services/raport_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:epsi/models/raport_model.dart';

class RaportProvider with ChangeNotifier {
  List<RaportModel> _raport = [];
  List<RaportModel> get raport => _raport;

  List<grafikTinggiModel> _grafikTinggi = [];
  List<grafikTinggiModel> get grafikTinggi => _grafikTinggi;

  List<grafikBeratModel> _grafikBerat = [];
  List<grafikBeratModel> get grafikBerat => _grafikBerat;

  Map<dynamic, dynamic>? _imunisasi;
  Map<dynamic, dynamic>? get imunisasi => _imunisasi;

  List? _dashboard;
  List? get dashboard => _dashboard;

  set dashboard(List? dashboard) {
    _dashboard = dashboard;
    notifyListeners();
  }

  set imunisasi(Map<dynamic, dynamic>? imunisasi) {
    _imunisasi = imunisasi;
    notifyListeners();
  }

  set raport(List<RaportModel> raport) {
    _raport = raport;
    notifyListeners();
  }

  set grafikTinggi(List<grafikTinggiModel> grafikTinggi) {
    _grafikTinggi = grafikTinggi;
    notifyListeners();
  }

  set grafikBerat(List<grafikBeratModel> grafikBerat) {
    _grafikBerat = grafikBerat;
    notifyListeners();
  }

  Future<void> getRaport({required String? idAnak}) async {
    try {
      List<RaportModel> raport =
          await RaportService().getRaport(idAnak: idAnak);

      _raport = raport;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getImunisasi({required String? idAnak}) async {
    try {
      imunisasi = await RaportService().getImunisasi(idAnak: idAnak);

      _imunisasi = imunisasi;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGrafikTinggi({required String? idAnak}) async {
    try {
      List<grafikTinggiModel> grafikTinggi =
          await RaportService().getGrafikTinggi(idAnak: idAnak);

      _grafikTinggi = grafikTinggi;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getGrafikBerat({required String? idAnak}) async {
    try {
      List<grafikBeratModel> grafikBerat =
          await RaportService().getGrafikBerat(idAnak: idAnak);

      _grafikBerat = grafikBerat;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getRaportDashboard() async {
    try {
      dashboard = await RaportService().getGrafikDashboard();

      _dashboard = dashboard;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
