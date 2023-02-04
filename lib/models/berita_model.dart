class BeritaModel {
  String? id;
  String? title;
  String? description;
  String? photo;

  BeritaModel({
    required this.id,
    required this.title,
    required this.description,
    required this.photo,
  });

  BeritaModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'photo': photo,
    };
  }
}
