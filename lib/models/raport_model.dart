import 'dart:ffi';

class RaportModel {
  String? id;
  String? name;
  int? tinggi_badan;
  int? berat_badan;
  String? umur;
  bool? hepatitis_b;
  bool? polio;
  bool? bcg;
  bool? dtp;
  bool? hib;
  bool? pcv;
  bool? rotavirus;
  bool? influenza;
  bool? mr;
  bool? je;
  bool? varisela;
  bool? hepatitis_a;
  bool? tifoid;
  bool? dengue;

  RaportModel({
    this.id,
    this.name,
    this.tinggi_badan,
    this.berat_badan,
    this.umur,
    this.hepatitis_b,
    this.polio,
    this.bcg,
    this.dtp,
    this.hib,
    this.pcv,
    this.rotavirus,
    this.influenza,
    this.mr,
    this.je,
    this.varisela,
    this.hepatitis_a,
    this.tifoid,
    this.dengue,
  });

  RaportModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    tinggi_badan = json['tinggi_badan'];
    berat_badan = json['berat_badan'];
    umur = json['umur'];
    hepatitis_b = json['imunisasi'][0]['hepatitis_b'];
    polio = json['imunisasi'][0]['polio'];
    bcg = json['imunisasi'][0]['bcg'];
    dtp = json['imunisasi'][0]['dtp'];
    hib = json['imunisasi'][0]['hib'];
    pcv = json['imunisasi'][0]['pcv'];
    rotavirus = json['imunisasi'][0]['rotavirus'];
    influenza = json['imunisasi'][0]['influenza'];
    mr = json['imunisasi'][0]['mr'];
    je = json['imunisasi'][0]['je'];
    varisela = json['imunisasi'][0]['varisela'];
    hepatitis_a = json['imunisasi'][0]['hepatitis_a'];
    tifoid = json['imunisasi'][0]['tifoid'];
    dengue = json['imunisasi'][0]['dengue'];
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tinggi_badan': tinggi_badan,
      'berat_badan': berat_badan,
      'umur': umur,
      'hepatitis_b': hepatitis_b,
      'polio': polio,
      'bcg': bcg,
      'dtp': dtp,
      'hib': hib,
      'pcv': pcv,
      'rotavirus': rotavirus,
      'influenza': influenza,
      'mr': mr,
      'je': je,
      'varisela': varisela,
      'hepatitis_a': hepatitis_a,
      'tifoid': tifoid,
      'dengue': dengue,
    };
  }
}

class grafikTinggiModel {
  int? tinggi_badan;
  int? bulan;

  grafikTinggiModel({
    this.tinggi_badan,
    this.bulan,
  });

  grafikTinggiModel.fromJson(Map<String, dynamic> json) {
    tinggi_badan = json['tinggi_badan'];
    bulan = json['bulan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'tinggi_badan': tinggi_badan,
      'bulan': bulan,
    };
  }
}

class grafikBeratModel {
  int? berat_badan;
  int? bulan;

  grafikBeratModel({
    this.berat_badan,
    this.bulan,
  });

  grafikBeratModel.fromJson(Map<String, dynamic> json) {
    berat_badan = json['berat_badan'];
    bulan = json['bulan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'berat_badan': berat_badan,
      'bulan': bulan,
    };
  }
}
