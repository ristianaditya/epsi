class AnakModel {
  String? id;
  String? name;
  String? nik;
  String? tempat_lahir;
  String? tanggal_lahir;
  String? jenis_kelamin;
  String? orangtua;

  AnakModel({
    required this.id,
    required this.name,
    required this.nik,
    required this.tempat_lahir,
    required this.tanggal_lahir,
    required this.jenis_kelamin,
    required this.orangtua,
  });

  AnakModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nik = json['nik'];
    tempat_lahir = json['tempat_lahir'];
    tanggal_lahir = json['tanggal_lahir'];
    jenis_kelamin = json['jenis_kelamin'];
    orangtua = json['orangtua'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nik': nik,
      'tempat_lahir': tempat_lahir,
      'tanggal_lahir': tanggal_lahir,
      'jenis_kelamin': jenis_kelamin,
      'orangtua': orangtua,
    };
  }
}
