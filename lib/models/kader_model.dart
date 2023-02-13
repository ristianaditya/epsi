class KaderModel {
  String? id;
  String? name;
  String? email;

  KaderModel({
    required this.id,
    required this.name,
    required this.email,
  });

  KaderModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
