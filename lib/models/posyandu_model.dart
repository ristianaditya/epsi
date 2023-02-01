class PosyanduModel {
  String? id;
  String? name;
  String? alamat;
  String? gambar;

  PosyanduModel({
    this.id,
    this.name,
    this.alamat,
    this.gambar,
  });

  PosyanduModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    alamat = json['alamat'];
    gambar = json['gambar'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'alamat': alamat,
      'gambar': gambar,
    };
  }
}
